import 'package:flutter/material.dart';
import 'package:flutter_project/calendar/calendar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 109, 109, 109),
      body: Calendar(),
    );
  }
}
