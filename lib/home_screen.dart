import 'package:flutter/material.dart';
import 'package:flutter_project/alert_confirm_widget.dart';
import 'package:flutter_project/dark_keyboard_widget.dart';
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

  Future<void> showAlert() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertConfirmWidget();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Keyboard')),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const Expanded(
              child: SizedBox.shrink(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: ElevatedButton(
                onPressed: () => showAlert(),
                child: const Text('Show AlertDialog()'),
              ),
            ),
            DarkKeyboardWidget(models: models),
          ],
        ),
      ),
    );
  }
}
