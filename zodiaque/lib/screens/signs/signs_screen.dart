import 'package:flutter/material.dart';
import 'package:zodiaque/models/signs.dart';
import 'package:zodiaque/screens/sign_detail/sign_detail_screen.dart';
import 'package:zodiaque/screens/signs/sign_page.dart';

class Signs extends StatelessWidget {
  const Signs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: PageController(initialPage: 0),
        scrollDirection: Axis.vertical,
        children: [
          ...List.generate(signs.length, (i) => i)
              .map((i) => GestureDetector(
                    child: SignPage(i),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignDetailScreen(i),
                      ));
                    },
                  ))
              .toList()
        ],
      ),
    );
  }
}
