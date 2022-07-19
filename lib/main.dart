import 'package:flutter/material.dart';
import 'package:flutter_project/home_screen.dart';
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
      title: 'Flutter Demo',
      // theme: GoogleTheme.lightTheme,
      // darkTheme: GoogleTheme.darkTheme,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: GoogleTheme.lightColorScheme,
          textTheme: GoogleTheme.lightTextTheme),
      darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: GoogleTheme.darkColorScheme,
          textTheme: GoogleTheme.darkTextTheme),
      home: const HomeScreen(),
    );
  }
}
