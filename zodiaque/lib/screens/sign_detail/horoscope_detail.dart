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

    return Container(
      padding: const EdgeInsets.fromLTRB(30, 5, 30, 10),
      child: Column(
        children: [
          Text(
            horoscope.siteName,
            style: const TextStyle(fontSize: 18.0, color: Colors.purple),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
            child: Text(
              horoscope.siteDescription,
              style: const TextStyle(color: Colors.purpleAccent),
            ),
          ),
          isLoading
              ? const CircularProgressIndicator(
                  color: Colors.purple,
                )
              : Text(horoscopeData),
        ],
      ),
    );
  }
}
