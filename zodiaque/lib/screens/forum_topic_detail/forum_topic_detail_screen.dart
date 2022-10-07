import 'package:flutter/material.dart';
import 'package:zodiaque/logic/mqtt_change_notifier.dart';
import 'package:zodiaque/screens/forum_topic_detail/forum_message.dart';
import 'package:zodiaque/screens/forum_topic_detail/forum_message_input.dart';
import 'package:zodiaque/screens/forum_topic_detail/forum_message_list.dart';

class ForumTopicDetailScreen extends StatelessWidget {
  const ForumTopicDetailScreen(this._topic, {super.key});

  final String _topic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_topic),
      ),
      body: Column(
        children: [
          Expanded(child: ForumMessageList(_topic)),
          ForumMessageInput(_topic),
        ],
      ),
    );
  }
}
