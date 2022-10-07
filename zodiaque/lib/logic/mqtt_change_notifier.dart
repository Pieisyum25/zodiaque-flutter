import 'package:flutter/cupertino.dart';
import 'package:zodiaque/models/sign.dart';
import 'package:zodiaque/models/signs.dart';

final MQTTChangeNotifier mqttChangeNotifier = MQTTChangeNotifier();

class MQTTChangeNotifier extends ChangeNotifier {
  final Map<String, List<String>> forumPosts = {};

  initPosts() {
    mqttChangeNotifier.forumPosts["General"] = [];
    for (Sign sign in signs) {
      mqttChangeNotifier.forumPosts[sign.name] = [];
    }
  }

  addPost(String topic, String message) {
    forumPosts[topic]!.add(message);
    notifyListeners();
  }
}
