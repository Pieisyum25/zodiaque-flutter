import 'package:flutter/material.dart';
import 'package:zodiaque/models/signs.dart';

/// SignPage represents a single zodiac sign, shown as a white card on the
/// SignsScreen. It displays the sign's symbol, its name, and its date period.
class SignPage extends StatelessWidget {
  const SignPage(this._signIndex, {super.key});

  final int _signIndex;

  @override
  Widget build(BuildContext context) {
    final sign = signs[_signIndex];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints.expand(
              height: 100.0,
            ),
            child: Image.asset(
              "assets/images/sign$_signIndex.png",
              fit: BoxFit.scaleDown,
              color: HSVColor.fromAHSV(1.0, _signIndex / 12.0 * 360.0, 1.0, 0.9)
                  .toColor(),
            ),
          ),
          Text(
            sign.name,
            style: const TextStyle(fontSize: 20.0, color: Colors.purple),
          ),
          Text(sign.periodToString())
        ],
      ),
    );
  }
}
