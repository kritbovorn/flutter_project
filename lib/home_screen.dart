import 'package:flutter/material.dart';
import 'package:flutter_project/components/dark_keyboard.dart';
import 'package:flutter_project/models/keyboard_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<KeyboardModel> models = [
    KeyboardModel(
        number: "1",
        letter: "",
        isShowLetter: true,
        isShowIconButton: false,
        isActive: true),
    KeyboardModel(
        number: "2",
        letter: "ABC",
        isShowLetter: true,
        isShowIconButton: false,
        isActive: true),
    KeyboardModel(
        number: "3",
        letter: "DEF",
        isShowLetter: true,
        isShowIconButton: false,
        isActive: true),
    KeyboardModel(
        number: "4",
        letter: "GHI",
        isShowLetter: true,
        isShowIconButton: false,
        isActive: true),
    KeyboardModel(
        number: "5",
        letter: "JKL",
        isShowLetter: true,
        isShowIconButton: false,
        isActive: true),
    KeyboardModel(
        number: "6",
        letter: "MNO",
        isShowLetter: true,
        isShowIconButton: false,
        isActive: true),
    KeyboardModel(
        number: "7",
        letter: "PQRS",
        isShowLetter: true,
        isShowIconButton: false,
        isActive: true),
    KeyboardModel(
        number: "8",
        letter: "TUV",
        isShowLetter: true,
        isShowIconButton: false,
        isActive: true),
    KeyboardModel(
        number: "9",
        letter: "WXYZ",
        isShowLetter: true,
        isShowIconButton: false,
        isActive: true),
    KeyboardModel(
        number: "",
        letter: "",
        isShowLetter: false,
        isShowIconButton: false,
        isActive: false),
    KeyboardModel(
        number: "0",
        letter: "",
        isShowLetter: false,
        isShowIconButton: false,
        isActive: true),
    KeyboardModel(
        number: "",
        letter: "",
        isShowLetter: false,
        isShowIconButton: true,
        isActive: true),
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
                  mainAxisExtent: 55,
                ),
                itemCount: models.length,
                itemBuilder: (BuildContext context, int index) {
                  return DarkKeyboard(
                    number: models[index].number,
                    letter: models[index].letter,
                    isActive: models[index].isActive,
                    isShowIconButton: models[index].isShowIconButton,
                    isShowLetter: models[index].isShowLetter,
                    onPressed: () {
                      debugPrint(index.toString());
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
