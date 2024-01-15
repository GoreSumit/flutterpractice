import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/screens.dart';

class AppDrawer extends StatelessWidget {
  final GlobalKey<BeamerState> beamerKey;

  const AppDrawer({Key? key, required this.beamerKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          MenuButton(
            beamer: beamerKey,
            uri: '/books',
            child: Text('Books'),
          ),
          SizedBox(height: 16.0),
          MenuButton(
            beamer: beamerKey,
            uri: '/articles',
            child: Text('Articles'),
          ),
          ListTile(
            title: const Text('Menu Item 1'),
            onTap: () {
              beamerKey.currentState?.routerDelegate.beamToNamed('/books');
              // Handle menu item 1 click
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: const Text('Menu Item 2'),
            onTap: () {
              // Handle menu item 2 click
              Navigator.pop(context); // Close the drawer
            },
          ),
          // Add more ListTile items as needed
        ],
      ),
    );
  }
}
