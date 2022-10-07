import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zodiaque/logic/mqtt_change_notifier.dart';

class ForumTopic extends StatefulWidget {
  const ForumTopic(this._topic, {super.key});

  final String _topic;

  @override
  State<ForumTopic> createState() => _ForumTopicState();
}

class _ForumTopicState extends State<ForumTopic> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: mqttChangeNotifier,
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget._topic,
                style: const TextStyle(fontSize: 18.0),
              ),
              Text(
                mqttChangeNotifier.forumPosts[widget._topic]!.isNotEmpty
                    ? mqttChangeNotifier.forumPosts[widget._topic]!.last
                    : "No Messages",
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),
        );
      },
    );
  }
}
