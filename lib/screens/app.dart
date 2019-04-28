import 'package:flutter/material.dart';
import 'package:hayum/screens/home/home_screen.dart';

class Hayum extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hayum',
      theme: ThemeData.dark(),
      home: HomeScreen(title: 'Hayum'),
    );
  }
}
