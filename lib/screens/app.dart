import 'package:flutter/material.dart';
import 'package:hayum/screens/auth/login_screen.dart';

class Hayum extends StatelessWidget {
  static final int _alpha = 0xff;

  // TODO: Improve theme
  final Color _primary = Color.fromARGB(_alpha, 5, 152, 141);
  final Color _primaryColorLight = Color.fromARGB(_alpha, 0, 145, 109);
  final Color _primaryColorDark = Color.fromARGB(_alpha, 5, 125, 116);
  final Color _accentColor = Color.fromARGB(_alpha, 0, 204, 142);

  ThemeData _buildTheme() {
    final ThemeData baseThemeData = ThemeData.dark();

    return baseThemeData.copyWith(
        primaryColor: _primary,
        primaryColorDark: _primaryColorDark,
        primaryColorLight: _primaryColorLight,
        accentColor: _accentColor
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
