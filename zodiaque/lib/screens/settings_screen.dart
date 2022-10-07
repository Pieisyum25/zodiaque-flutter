import 'package:flutter/material.dart';
import 'package:zodiaque/models/mqtt_client.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final usernameController = TextEditingController(text: username);

  void _setAnonymous(value) {
    setState(() {
      anonymous = value;
    });
  }

  void _setUsername(text) {
    if (text.isEmpty) return;
    username = text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Anonymous:",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Switch(
                      value: anonymous,
                      onChanged: _setAnonymous,
                      activeTrackColor: Colors.purpleAccent.shade100,
                      activeColor: Colors.deepPurple,
                    ),
                  ],
                ),
              ),
              TextField(
                enabled: !anonymous,
                controller: usernameController,
                onChanged: (value) => _setUsername(value),
                decoration: InputDecoration(
                  filled: anonymous,
                  fillColor: const Color.fromARGB(255, 234, 234, 234),
                  enabledBorder: const OutlineInputBorder(),
                  disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  floatingLabelStyle:
                      TextStyle(color: anonymous ? Colors.grey : Colors.purple),
                  labelText: "Username",
                ),
                style: TextStyle(color: anonymous ? Colors.grey : Colors.black),
              ),
            ],
          ),
        ));
  }
}
