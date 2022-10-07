import 'package:flutter/material.dart';
import 'package:zodiaque/models/entry.dart';

class JournalEntry extends StatelessWidget {
  const JournalEntry(this._entry, {super.key});

  final Entry _entry;

  @override
  Widget build(BuildContext context) {
    final dateTime = _entry.dateTime;
    final dateTimeString =
        "[${dateTime.day}/${dateTime.month}/${dateTime.year}, ${dateTime.hour}:${dateTime.minute}]";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(dateTimeString),
        Text(
          _entry.title,
          style: const TextStyle(fontSize: 18.0),
        ),
        Text(
          _entry.body,
          style: const TextStyle(color: Colors.black54),
        ),
      ],
    );
  }
}
