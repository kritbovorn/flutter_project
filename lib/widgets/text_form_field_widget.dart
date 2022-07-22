import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final VoidCallback onPressed;
  final bool isShowKeyboard;
  const TextFormFieldWidget({
    Key? key,
    required this.textEditingController,
    required this.onPressed,
    required this.isShowKeyboard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.black45,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        letterSpacing: 8,
      ),
      controller: textEditingController,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: isShowKeyboard
              ? const Icon(Icons.keyboard_hide_outlined)
              : const Icon(Icons.keyboard),
        ),
        hintText: 'กรุณากรอกรหัสพลเมือง',
        hintStyle: const TextStyle(
            fontSize: 18, color: Colors.black38, letterSpacing: 1.5),
        fillColor: Colors.white54,
      ),
    );
  }
}
