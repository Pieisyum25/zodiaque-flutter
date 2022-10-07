import 'package:flutter/material.dart';

/// ForumMessage represents a message received within the ForumMessageList.
class ForumMessage extends StatelessWidget {
  const ForumMessage(this._message, {super.key});

  final String _message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 8, 20, 10),
                  child: Text(
                    _message,
                    style: const TextStyle(fontSize: 15.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
