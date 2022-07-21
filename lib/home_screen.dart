// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_project/alert_confirm_widget.dart';
import 'package:flutter_project/keyboard/keyboard_widget/dark_keyboard_widget.dart';
import 'package:flutter_project/keyboard/keyboard_model/keyboard_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textEditingController = TextEditingController();
  List<String> results = [];
  String result = "";
  bool hasShowIcon = false;
  bool hasActive = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> showAlert() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertConfirmWidget();
      },
    );
  }

  void changeState() {
    if (textEditingController.text.isNotEmpty) {
      hasShowIcon = true;
      hasActive = true;
    } else {
      hasActive = false;
      hasShowIcon = false;
    }
  }

  String addResult(String value) {
    if (value == "remove") {
      result = result.substring(0, result.length - 1);
    } else {
      result += value;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Keyboard',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  hintText: 'กรุณากรอกรหัสซิมการ์ด',
                  fillColor: Colors.white54,
                ),
              ),
            ),
            DarkKeyboardWidget(
                hasActive: hasActive,
                hasShowIcon: hasShowIcon,
                models: models,
                values: (value) {
                  textEditingController.text = addResult(value);

                  setState(() {
                    changeState();
                  });
                }),
          ],
        ),
      ),
    );
  }
}
