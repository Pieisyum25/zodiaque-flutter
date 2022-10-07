import 'package:zodiaque/models/horoscope.dart';

/// List of websites that can be web scraped for their horoscope data, with
/// the exact webpage url and text element location specified.
final horoscopes = [
  Horoscope(
    "dailyhoroscope.com",
    "Daily Horoscopes, Love Horoscopes...",
    "https://www.dailyhoroscope.com/horoscopes/daily/%s?full=true",
    (document) => document.getElementsByClassName("body")[0].firstChild?.text,
  ),
  Horoscope("astrology.com", "Horoscopes, Tarot & Love Compatibility",
      "https://www.astrology.com/horoscope/daily/%s.html", (document) {
    String? date = document.getElementById("content-date")?.text.trim();
    String? content = document.getElementById("content")?.text.trim();
    if (date == null || content == null) return null;
    return "$date - $content";
  }),
];
