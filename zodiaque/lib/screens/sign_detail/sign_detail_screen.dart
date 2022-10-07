import 'package:flutter/material.dart';
import 'package:zodiaque/models/horoscopes.dart';
import 'package:zodiaque/models/signs.dart';
import 'package:zodiaque/screens/sign_detail/horoscope_detail.dart';

/// SignDetailScreen is a screen showing the current day's horoscopes for a
/// particular zodiac sign, where each horoscope is web scraped from a webpage.
/// These horoscopes are shown in a list.
class SignDetailScreen extends StatelessWidget {
  const SignDetailScreen(this._signIndex, {super.key});

  final int _signIndex;

  @override
  Widget build(BuildContext context) {
    final sign = signs[_signIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(sign.name),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Center(
                child: Text(
              sign.name,
              style: const TextStyle(
                  color: Colors.purple,
                  fontSize: 30.0,
                  decoration: TextDecoration.underline),
            )),
          ),
          ...List.generate(horoscopes.length, (i) => i)
              .map((i) => HoroscopeDetail(i, _signIndex))
              .toList()
        ],
      ),
    );
  }
}
