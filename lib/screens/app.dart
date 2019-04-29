import 'package:flutter/material.dart';
import 'package:hayum/screens/auth/login_screen.dart';

class Hayum extends StatelessWidget {
  ThemeData _buildTheme() {
    final ThemeData baseThemeData = ThemeData.dark();

    // TODO: setup hayum's theme data
    return baseThemeData.copyWith(
//      accentColor: Cl
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hayum',
      theme: _buildTheme(),
      home: LoginScreen(title: 'Login'),
    );
  }
}
