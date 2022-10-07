import 'package:flutter/cupertino.dart';
import 'package:zodiaque/logic/mqtt_change_notifier.dart';
import 'package:zodiaque/screens/forum_topic_detail/forum_message.dart';

class ForumMessageList extends StatefulWidget {
  const ForumMessageList(this._topic, {super.key});

  final String _topic;

  @override
  State<ForumMessageList> createState() => _ForumMessageListState();
}

class _ForumMessageListState extends State<ForumMessageList> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: mqttChangeNotifier,
        builder: (context, child) {
          return ListView(
            children: [
              ...mqttChangeNotifier.forumPosts[widget._topic]!
                  .map((msg) => ForumMessage(msg)),
            ],
          );
        });
  }
}
