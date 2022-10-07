import 'package:flutter/material.dart';
import 'package:zodiaque/models/signs.dart';
import 'package:zodiaque/screens/sign_detail/sign_detail_screen.dart';
import 'package:zodiaque/screens/signs/sign_page.dart';

class SignsScreen extends StatelessWidget {
  const SignsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 27, 0, 32),
      child: ListView(
        children: [
          ...List.generate(signs.length, (i) => i)
              .map((i) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LimitedBox(
                          maxWidth: 200,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: GestureDetector(
                              child: SignPage(i),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignDetailScreen(i),
                                ));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList()
        ],
      ),
    );
  }
}
