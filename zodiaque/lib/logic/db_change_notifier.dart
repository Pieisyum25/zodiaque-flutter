import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:zodiaque/models/entry.dart';

final DBChangeNotifier dbChangeNotifier = DBChangeNotifier();

/// DBChangeNotifier is a ChangeNotifier for a local database using Hive.
/// Repo: https://github.com/hivedb/hive
/// The local database (in the form of a Box of Entries) stores the Entries
/// in the user's journal and allows basic CRUD operations.
class DBChangeNotifier extends ChangeNotifier {
  /// Database access object.
  Box<Entry>? journalBox;

  /// Initialises the database access object (Box) and notifies any listening
  /// widgets that it is now accessible.
  initJournalBox(Box<Entry> journalBox) {
    this.journalBox = journalBox;
    notifyListeners();
  }

  /// Adds an Entry to the database and notifies listening widgets.
  addEntry(Entry entry) {
    journalBox!.add(entry);
    notifyListeners();
  }

  /// Updates an Entry in the database and notifies listening widgets.
  setEntry(Entry entry, int index) {
    journalBox!.putAt(index, entry);
    notifyListeners();
  }

  /// Deletes an Entry in the database and notifies listening widgets.
  deleteEntry(int index) {
    journalBox!.deleteAt(index);
    notifyListeners();
  }
}
