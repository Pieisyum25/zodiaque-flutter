import 'package:flutter/material.dart';
import 'package:zodiaque/screens/forum/forum_screen.dart';
import 'package:zodiaque/screens/journal/journal_screen.dart';
import 'package:zodiaque/screens/settings_screen.dart';
import 'package:zodiaque/screens/signs/signs_screen.dart';

/// TabsScreen is a screen with a bottom tab bar for navigating between the
/// three main sections of the app: the SignsScreen, the ForumScreen, and the
/// JournalScreen.
class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 1;
  static const List<Widget> _screens = [
    JournalScreen(),
    SignsScreen(),
    ForumScreen(),
  ];

  // Sets the selected tab, changing screen if it is different.
  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Navigates to the SettingsScreen whenever the settings icon is pressed.
  void _onSettingsPressed() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SettingsScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zodiaque'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: _onSettingsPressed,
            tooltip: 'Settings',
          ),
        ],
      ),
      body: Center(
        child: _screens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Journal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border_outlined),
            label: 'Horoscopes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Forum',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onTabTapped,
      ),
    );
  }
}
