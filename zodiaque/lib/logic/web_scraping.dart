import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:zodiaque/models/horoscopes.dart';
import 'package:zodiaque/models/signs.dart';

/// Web scrapes horoscope data for a given zodiac sign (signIndex) from a given
/// website (horoscopeIndex) and returns the data in text form.
Future<String> scrapeHoroscopeData(int horoscopeIndex, int signIndex) async {
  final horoscope = horoscopes[horoscopeIndex];
  final sign = signs[signIndex];

  // Create url of horoscope webpage:
  final url = horoscope.url.replaceFirst("%s", sign.name.toLowerCase());
  final response = await http.Client().get(Uri.parse(url));

  // If successfully connected, get html document:
  if (response.statusCode == 200) {
    Document document = parser.parse(response.body);
    try {
      // Attempt to scrape the horoscope text from the document:
      String data =
          horoscope.scrapeFunction(document)?.trim() ?? "Loading Failed.";
      return data;
    } catch (e) {
      return "Loading Failed.";
    }
  }
  return "Loading Failed. Status Code: ${response.statusCode}";
}
