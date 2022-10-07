import 'package:flutter/cupertino.dart';
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
        return Column(
          children: [
            Text(widget._topic),
            mqttChangeNotifier.forumPosts[widget._topic]!.isNotEmpty
                ? Text(mqttChangeNotifier.forumPosts[widget._topic]!.last)
                : const Text(""),
          ],
        );
      },
    );
  }
}
