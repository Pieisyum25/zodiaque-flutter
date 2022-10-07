import 'package:flutter/cupertino.dart';
import 'package:zodiaque/models/signs.dart';

class SignPage extends StatelessWidget {
  const SignPage(this._signIndex, {super.key});

  final int _signIndex;

  @override
  Widget build(BuildContext context) {
    final sign = signs[_signIndex];

    return Column(
      children: [Text(sign.name), Text(sign.periodToString())],
    );
  }
}
