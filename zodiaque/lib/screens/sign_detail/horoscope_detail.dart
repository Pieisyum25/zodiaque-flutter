import 'package:flutter/material.dart';
import 'package:zodiaque/logic/web_scraping.dart';
import 'package:zodiaque/models/horoscopes.dart';

class HoroscopeDetail extends StatefulWidget {
  const HoroscopeDetail(this._horoscopeIndex, this._signIndex, {super.key});

  final int _horoscopeIndex;
  final int _signIndex;

  @override
  State<HoroscopeDetail> createState() => _HoroscopeDetailState();
}

class _HoroscopeDetailState extends State<HoroscopeDetail> {
  bool isLoading = true;
  String horoscopeData = "";

  @override
  void initState() {
    scrapeHoroscopeData(widget._horoscopeIndex, widget._signIndex)
        .then((data) => setState(() {
              horoscopeData = data;
              isLoading = false;
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final horoscope = horoscopes[widget._horoscopeIndex];

    return Column(
      children: [
        Text(horoscope.siteName),
        Text(horoscope.siteDescription),
        isLoading ? const CircularProgressIndicator() : Text(horoscopeData),
      ],
    );
  }
}
