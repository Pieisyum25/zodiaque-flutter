import 'package:flutter/cupertino.dart';
import 'package:zodiaque/models/sign.dart';
import 'package:zodiaque/models/signs.dart';

final MQTTChangeNotifier mqttChangeNotifier = MQTTChangeNotifier();

/// MQTTChangeNotifier is a ChangeNotifier for storing forum posts
/// received from the MQTT broker.
/// This is used for managing the messages in the forum section of the app.
class MQTTChangeNotifier extends ChangeNotifier {
  /// Map of posts/messages indexed by topic.
  final Map<String, List<String>> forumPosts = {};

  /// Initialises the map of forum posts.
  initPosts() {
    mqttChangeNotifier.forumPosts["General"] = [];
    for (Sign sign in signs) {
      mqttChangeNotifier.forumPosts[sign.name] = [];
    }
  }

  /// Adds a post with a given topic to the map of forum posts,
  /// and notifies any listening widgets.
  addPost(String topic, String message) {
    forumPosts[topic]!.add(message);
    notifyListeners();
  }
}
