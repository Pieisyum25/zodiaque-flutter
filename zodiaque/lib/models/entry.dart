import 'package:hive/hive.dart';

part 'entry.g.dart';

/// Entry represents a journal entry with a date/time, title, and body.
/// It uses annotations to allow Hive to create an adapter for storing
/// Entries in a local database.
@HiveType(typeId: 1)
class Entry {
  Entry(this.dateTime, this.title, this.body);

  /// Date and time Entry was created.
  @HiveField(0)
  DateTime dateTime;

  /// Title text of Entry.
  @HiveField(1)
  String title;

  /// Body text of Entry.
  @HiveField(2)
  String body;

  @override
  String toString() {
    return "$dateTime, $title, $body";
  }
}
