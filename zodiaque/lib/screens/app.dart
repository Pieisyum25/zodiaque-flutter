import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:zodiaque/logic/db_change_notifier.dart';
import 'package:zodiaque/logic/mqtt_change_notifier.dart';
import 'package:zodiaque/models/entry.dart';
import 'package:zodiaque/models/mqtt_client.dart';
import 'package:zodiaque/models/sign.dart';
import 'package:zodiaque/models/signs.dart';
import 'package:zodiaque/screens/tabs.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

/// App is the main widget of the application, responsible for initialising
/// the MQTT client for the forum part of the app, and the local database
/// (using Hive) for the journal part of the app.
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    // Init MQTT:
    mqttChangeNotifier.initPosts();
    mqttClientManager.connect().then((value) {
      // Subscribe to all topics:
      mqttClientManager.subscribe("General");
      for (Sign sign in signs) {
        mqttClientManager.subscribe(sign.name);
      }

      // Listen for posts from each topic and add them to the MQTTChangeNotifier
      // when received:
      mqttClientManager
          .getMessagesStream()!
          .listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
        final recMess = c![0].payload as MqttPublishMessage;
        final pt =
            MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
        print(
            'MQTTClient::Message received on topic: <${c[0].topic}> is $pt\n');
        mqttChangeNotifier.addPost(c[0].topic, pt);
      });
    });

    // Init Local Database (uses Hive):
    path_provider.getApplicationDocumentsDirectory().then((value) {
      // Retrieve the Box of Entries from the application documents directory:
      Hive.initFlutter(value.path).then((value) {
        Hive.registerAdapter(EntryAdapter());
        Hive.openBox<Entry>("journalBox").then((value) {
          dbChangeNotifier.initJournalBox(value);
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Zodiaque",
      home: const TabsScreen(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
