// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CalendarText extends StatelessWidget {
  final String title;
  final Color? fontColor;
  final double? fontSize;
  final double? textHeight;
  const CalendarText({
    Key? key,
    required this.title,
    this.fontColor = Colors.white,
    this.fontSize,
    this.textHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize ?? 32,
        height: textHeight ?? 1,
      ),
    );
  }
}

// 1. Primary = 32
// 2. Secondary = 17