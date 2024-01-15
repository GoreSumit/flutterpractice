// login_screen.dart

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final _beamerKey = GlobalKey<BeamerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Simulate a successful login
            // Navigate to the home screen after a successful login
            Beamer.of(context).beamToNamed('/');
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}
