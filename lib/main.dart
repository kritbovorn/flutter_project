import 'package:flutter/material.dart';
import 'package:flutter_project/screens/home_screen.dart';
import 'package:flutter_project/theme/google_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: GoogleTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
