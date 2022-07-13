// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class DisPlayCupertinoDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onPressed;
  const DisPlayCupertinoDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content:  Text(content),
      actions: [
        CupertinoDialogAction(
          onPressed: onPressed,
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
