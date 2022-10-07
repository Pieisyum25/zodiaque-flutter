import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:zodiaque/logic/mqtt_change_notifier.dart';
import 'package:zodiaque/models/mqtt_client.dart';
import 'package:zodiaque/models/sign.dart';
import 'package:zodiaque/models/signs.dart';
import 'package:zodiaque/screens/signs/signs_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Zodiaque",
      home: SignsScreen(),
    );
  }
}
