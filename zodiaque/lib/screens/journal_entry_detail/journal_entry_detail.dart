import 'package:flutter/material.dart';
import 'package:zodiaque/logic/db_change_notifier.dart';
import 'package:zodiaque/models/entry.dart';

class JournalEntryDetailScreen extends StatelessWidget {
  JournalEntryDetailScreen(this._entry, {this.index = -1, super.key});

  final Entry _entry;
  final int index;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _titleController.text = _entry.title;
    _bodyController.text = _entry.body;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Journal Entry"),
      ),
      body: Column(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)),
                      floatingLabelStyle: TextStyle(color: Colors.purple),
                      labelText: "Title...",
                    ),
                  ),
                ),
                TextField(
                  controller: _bodyController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple)),
                    floatingLabelStyle: TextStyle(color: Colors.purple),
                    labelText: "Body...",
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (index != -1)
                TextButton(
                  onPressed: () {
                    dbChangeNotifier.deleteEntry(index);
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Delete",
                    style: TextStyle(fontSize: 20.0, color: Colors.purple),
                  ),
                ),
              TextButton(
                  onPressed: () {
                    Entry entry = Entry(_entry.dateTime, _titleController.text,
                        _bodyController.text);
                    if (index == -1) {
                      dbChangeNotifier.addEntry(entry);
                    } else {
                      dbChangeNotifier.setEntry(entry, index);
                    }
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(fontSize: 20.0, color: Colors.purple),
                  )),
            ],
          ),
        ),
      ]),
    );
  }
}
