import 'package:flutter/material.dart';
import 'package:zodiaque/models/entry.dart';

/// JournalEntry represents an Entry as a list item for the list in
/// JournalScreen. Each JournalEntry contains all the details of the Entry,
/// including its DateTime of creation, title, and body text.
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
