import 'package:flutter/material.dart';
import 'package:flutter_project/components/dark_keyboard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<Dar> cells = List.filled(10, DarkKeyboard);
  List<String> numbers = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
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
    "WXYZ",
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
              padding: const EdgeInsets.all(8),
              color: const Color(0xFF323234),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 65,
                ),
                itemCount: 9,
                itemBuilder: (BuildContext context, int index) {
                  return DarkKeyboard(
                    number: numbers[index],
                    letter: letters[index],
                    onPressed: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
