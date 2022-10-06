import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:zodiaque/models/horoscopes.dart';
import 'package:zodiaque/models/signs.dart';

Future<String> scrapeHoroscopeData(int horoscopeIndex, int signIndex) async {
  final horoscope = horoscopes[horoscopeIndex];
  final sign = signs[signIndex];

  final url = horoscope.url.replaceFirst("%s", sign.name.toLowerCase());
  final response = await http.Client().get(Uri.parse(url));

  if (response.statusCode == 200) {
    Document document = parser.parse(response.body);
    try {
      String data =
          horoscope.scrapeFunction(document)?.trim() ?? "Loading Failed.";
      return data;
    } catch (e) {
      return "Loading Failed.";
    }
  }
  return "Loading Failed. Status Code: ${response.statusCode}";
}
