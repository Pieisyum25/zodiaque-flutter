import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:zodiaque/logic/db_change_notifier.dart';
import 'package:zodiaque/models/entry.dart';
import 'package:zodiaque/screens/journal/journal_entry.dart';
import 'package:zodiaque/screens/journal_entry_detail/journal_entry_detail.dart';

/// JournalScreen is a screen showing a list of all the user's personal journal
/// Entries. Each Entry is stored in a local database (using Hive), and the
/// user can easily select an Entry by tapping on it or add an Entry by
/// pressing the text button at the bottom.
class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  @override
  Widget build(BuildContext context) {
    final Box<Entry>? journalBox = dbChangeNotifier.journalBox;
    final bool isLoading = journalBox == null;

    return AnimatedBuilder(
        animation: dbChangeNotifier,
        builder: (context, child) {
          return Column(children: [
            Expanded(
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: Colors.purple,
                      ))
                    : journalBox.isEmpty
                        ? const Center(
                            child: Text(
                            "No Entries...",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.purple),
                          ))
                        : Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListView(
                              children: [
                                ...List.generate(journalBox.length, (i) => i)
                                    .map((i) {
                                  Entry entry = journalBox.getAt(i)!;

                                  return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              JournalEntryDetailScreen(entry,
                                                  index: i),
                                        ));
                                      },
                                      child: Column(
                                        children: [
                                          JournalEntry(entry),
                                          const Divider()
                                        ],
                                      ));
                                }).toList()
                              ],
                            ),
                          )),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => JournalEntryDetailScreen(
                          Entry(DateTime.now(), "", "")),
                    ));
                  },
                  child: const Text(
                    "Add Entry",
                    style: TextStyle(fontSize: 20.0, color: Colors.purple),
                  )),
            ),
          ]);
        });
  }
}
