// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final String? actionTitle;
  final VoidCallback callback;

  const CustomDialog({
    Key? key,
    required this.title,
    required this.content,
    this.actionTitle,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(  
      title: Text(title),
      content: Text(content),
      actions: [
        ElevatedButton(  
          onPressed: callback,
          child: Text(actionTitle ?? 'Reset'),
        ),
      ],
    );
  }
}
