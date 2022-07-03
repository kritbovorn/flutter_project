import 'package:flutter/material.dart';
import 'package:flutter_project/test1.dart';
import 'package:flutter_project/theme/google_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: GoogleTheme.lightTheme,
      title: 'Flutter Demo',
      home: const Test1(),
      // home: const Test(),
      // home: const HomeScreen(),
      // home: SampleUi(),
    );
  }
}
