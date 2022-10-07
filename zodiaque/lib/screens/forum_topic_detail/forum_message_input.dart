import 'package:flutter/material.dart';
import 'package:zodiaque/models/mqtt_client.dart';

class ForumMessageInput extends StatelessWidget {
  ForumMessageInput(this._topic, {super.key});

  final String _topic;
  final textFieldController = TextEditingController();

  void _attemptSubmit() {
    String text = textFieldController.text;
    if (text.isEmpty) return;
    mqttClientManager.publishMessage(_topic, text);
    textFieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: textFieldController,
            onEditingComplete: _attemptSubmit,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Enter a message...",
            ),
          ),
        ),
        IconButton(onPressed: _attemptSubmit, icon: const Icon(Icons.send))
      ],
    );
  }
}
