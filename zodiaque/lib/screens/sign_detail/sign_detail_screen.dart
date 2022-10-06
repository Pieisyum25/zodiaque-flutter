import 'package:flutter/material.dart';
import 'package:zodiaque/models/horoscopes.dart';
import 'package:zodiaque/models/signs.dart';
import 'package:zodiaque/screens/sign_detail/horoscope_detail.dart';

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
          Text(sign.name),
          ...List.generate(horoscopes.length, (i) => i)
              .map((i) => HoroscopeDetail(i, _signIndex))
              .toList()
        ],
      ),
    );
  }
}
