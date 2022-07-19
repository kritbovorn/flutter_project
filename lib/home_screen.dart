import 'package:flutter/material.dart';
import 'package:flutter_project/components/dark_keyboard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Keyboard')),
      body: Center(
        child: DarkKeyboard(
          number: 3,
          letter: "ABC",
          onPressed: () {},
        ),
      ),
    );
  }
}
