import 'package:flutter/material.dart';
import 'package:zodiaque/logic/mqtt_change_notifier.dart';
import 'package:zodiaque/screens/forum/forum_topic.dart';
import 'package:zodiaque/screens/forum_topic_detail/forum_topic_detail_screen.dart';

/// ForumScreen is a screen showing a list of forum topics available to the user
/// that they can post on, along with each forum's most recent message.
/// There is one forum for each zodiac sign, along with a general forum.
/// An MQTT publish/subscribe broker server is used to manage this.
class ForumScreen extends StatelessWidget {
  const ForumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          ...mqttChangeNotifier.forumPosts.keys.map((topic) => Column(
                children: [
                  GestureDetector(
                    child: ForumTopic(topic),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ForumTopicDetailScreen(topic),
                      ));
                    },
                  ),
                  const Divider(),
                ],
              ))
        ],
      ),
    );
  }
}
