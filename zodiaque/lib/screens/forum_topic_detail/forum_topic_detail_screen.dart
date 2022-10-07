import 'package:flutter/material.dart';
import 'package:zodiaque/screens/forum_topic_detail/forum_message_input.dart';
import 'package:zodiaque/screens/forum_topic_detail/forum_message_list.dart';

/// ForumTopicDetailScreen represents a forum page for a given topic.
/// It allows the user to read any messages that have been posted and post
/// messages themselves.
/// It uses the MQTT protocol.
class ForumTopicDetailScreen extends StatelessWidget {
  const ForumTopicDetailScreen(this._topic, {super.key});

  final String _topic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$_topic Forum"),
      ),
      body: Container(
        color: const Color.fromARGB(255, 27, 0, 32),
        child: Column(
          children: [
            Expanded(child: ForumMessageList(_topic)),
            ForumMessageInput(_topic),
          ],
        ),
      ),
    );
  }
}
