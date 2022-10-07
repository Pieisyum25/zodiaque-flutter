import 'package:flutter/cupertino.dart';

class ForumMessage extends StatelessWidget {
  const ForumMessage(this._message, {super.key});

  final String _message;

  @override
  Widget build(BuildContext context) {
    return Text(_message);
  }
}
