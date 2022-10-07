import 'package:html/dom.dart';

/// Horoscope represents a section of a webpage containing horoscope data that
/// can be used for web scraping.
class Horoscope {
  /// Website name.
  final String siteName;

  /// Website description.
  final String siteDescription;

  /// Horoscope webpage url (requires formatting to be used for a specific sign).
  final String url;

  /// Closure for accessing a certain element of the webpage when scraping text.
  final String? Function(Document) scrapeFunction;

  const Horoscope(
      this.siteName, this.siteDescription, this.url, this.scrapeFunction);
}
