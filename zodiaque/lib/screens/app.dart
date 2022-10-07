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
      mqttClientManager.subscribe("General");
      for (Sign sign in signs) {
        mqttClientManager.subscribe(sign.name);
      }

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

    // Init Local Database:
    path_provider.getApplicationDocumentsDirectory().then((value) {
      Hive.initFlutter(value.path).then((value) {
        Hive.registerAdapter(EntryAdapter());
        Hive.openBox<Entry>("journalBox").then((value) {
          print(value.toString());
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
