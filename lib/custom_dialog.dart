// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final String? actionTitle;
  final Color? backgroundColor;
  final VoidCallback callback;

  const CustomDialog({
    Key? key,
    required this.title,
    required this.content,
    this.actionTitle,
    this.backgroundColor,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      content: Text(content),
      contentTextStyle: const TextStyle(color: Colors.white70),
      backgroundColor: backgroundColor ?? const Color.fromARGB(255, 43, 44, 50),
      actions: [
        ElevatedButton(
          onPressed: callback,
          child: Text(actionTitle ?? 'Reset'),
        ),
      ],
    );
  }
}
