import 'package:flutter/material.dart';
import 'package:zodiaque/models/mqtt_client.dart';

/// ForumMessageInput describes a row at the bottom of the ForumTopicDetailScreen
/// containing a text field for entering a message and a button for sending it.
class ForumMessageInput extends StatelessWidget {
  ForumMessageInput(this._topic, {super.key});

  final String _topic;
  final textFieldController = TextEditingController();

  /// Attempt to submit the currently entered message.
  /// Fails if the message is blank.
  /// If it succeeds, it appends a timestamp and username to the start of
  /// the message.
  void _attemptSubmit() {
    String text = textFieldController.text;
    if (text.isEmpty) return;
    DateTime date = DateTime.now();
    String user = anonymous ? "Anonymous" : username;
    text =
        "[${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}] $user:\n$text";
    mqttClientManager.publishMessage(_topic, text);
    textFieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textFieldController,
              onEditingComplete: _attemptSubmit,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple)),
                floatingLabelStyle: TextStyle(color: Colors.purple),
                labelText: "Enter a message...",
              ),
            ),
          ),
          IconButton(
              onPressed: _attemptSubmit,
              icon: const Icon(
                Icons.send,
                color: Colors.purple,
              ))
        ],
      ),
    );
  }
}
