import 'package:html/dom.dart';

class Horoscope {
  final String siteName;
  final String siteDescription;
  final String url;
  final String? Function(Document) scrapeFunction;

  const Horoscope(
      this.siteName, this.siteDescription, this.url, this.scrapeFunction);
}
