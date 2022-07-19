import 'package:flutter/material.dart';
import 'package:flutter_project/components/dark_keyboard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<Dar> cells = List.filled(10, DarkKeyboard);
  List<int> numbers = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
  ];
  List<String> letters = [
    "",
    "ABC",
    "DEF",
    "GHI",
    "JKL",
    "MNO",
    "PQRS",
    "TUV",
    "WXYZ"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Keyboard')),
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              child: SizedBox.shrink(),
            ),
            Container(
              height: 300,
              color: const Color(0xFF323234),
              child: Wrap(
                children: List.generate(
                    9,
                    (index) => DarkKeyboard(
                          letter: letters[index],
                          number: numbers[index],
                          onPressed: () {},
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
