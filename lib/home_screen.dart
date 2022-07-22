import 'package:flutter/material.dart';

import 'package:flutter_project/alert_confirm_widget.dart';
import 'package:flutter_project/keyboard/keyboard_widget/dark_keyboard_widget.dart';
import 'package:flutter_project/keyboard/keyboard_model/keyboard_model.dart';
import 'package:flutter_project/widgets/container_sex.dart';
import 'package:flutter_project/widgets/text_form_field_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController textEditingController;
  String result = "";
  bool hasShowIcon = false;
  bool hasActive = false;

  bool isShowKeyboard = false;
  bool isSex = true;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
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

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
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
        bottom: isShowKeyboard ? false : true,
        child: Column(
          children: [
            const Expanded(
              child: SizedBox.shrink(),
            ),
            ContainerSex(
              isSex: isSex,
              onPressed: () => setState(() => isSex = !isSex),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: ElevatedButton(
                onPressed: () => showAlert(),
                child: const Text('Show AlertDialog()'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: ElevatedButton(
                onPressed: () {
                  setState(() => isShowKeyboard = !isShowKeyboard);
                  FocusScope.of(context).unfocus();
                },
                child: isShowKeyboard
                    ? const Text('Hide Keyboard')
                    : const Text('Show keyboard'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormFieldWidget(
                textEditingController: textEditingController,
                isShowKeyboard: isShowKeyboard,
                onPressed: () =>
                    setState(() => isShowKeyboard = !isShowKeyboard),
              ),
            ),
            if (isShowKeyboard)
              DarkKeyboardWidget(
                hasActive: hasActive,
                hasShowIcon: hasShowIcon,
                models: models,
                values: (value) {
                  textEditingController.text = addResult(value);
                  setState(() => changeState());
                },
              ),
          ],
        ),
      ),
    );
  }
}
