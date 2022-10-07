import 'package:flutter/material.dart';
import 'package:zodiaque/logic/mqtt_change_notifier.dart';
import 'package:zodiaque/screens/forum/forum_topic.dart';
import 'package:zodiaque/screens/forum_topic_detail/forum_topic_detail_screen.dart';

class ForumScreen extends StatelessWidget {
  const ForumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          ...mqttChangeNotifier.forumPosts.keys.map((topic) => GestureDetector(
                child: ForumTopic(topic),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ForumTopicDetailScreen(topic),
                  ));
                },
              ))
        ],
      ),
    );
  }
}
