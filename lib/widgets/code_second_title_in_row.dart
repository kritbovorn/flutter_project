// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CodeSecondTitleInRow extends StatelessWidget {
  final String firstTitle;
  final VoidCallback firstPressed;
  final String secondTitle;
  final VoidCallback secondPressed;
  const CodeSecondTitleInRow({
    Key? key,
    required this.firstTitle,
    required this.firstPressed,
    required this.secondTitle,
    required this.secondPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: firstPressed,
          child: Text(firstTitle, style: Theme.of(context).textTheme.subtitle2),
        ),
        TextButton(
          onPressed: secondPressed,
          child:
              Text(secondTitle, style: Theme.of(context).textTheme.subtitle2),
        ),
      ],
    );
  }
}
