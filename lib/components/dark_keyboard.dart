// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DarkKeyboard extends StatelessWidget {
  final String number;
  final String letter;
  final Color? fontColor;
  final Color? primaryColor;
  final double? numFontSize;
  final double? letterFontSize;
  final double? numFontHeight;
  final FontWeight? numFontWeight;
  final FontWeight? letterFontWeight;
  final double? letterFontHeight;
  final double? buttonHeight;
  final VoidCallback onPressed;
  final bool? isShowLetter;
  const DarkKeyboard({
    Key? key,
    required this.number,
    required this.letter,
    this.fontColor = const Color(0xFFF6F6F6),
    this.primaryColor = const Color(0xFF6B6B6B),
    this.numFontSize = 30,
    this.letterFontSize = 12,
    this.numFontHeight = 1,
    this.numFontWeight = FontWeight.w600,
    this.letterFontWeight = FontWeight.w500,
    this.letterFontHeight = 1.5,
    this.buttonHeight,
    required this.onPressed,
    this.isShowLetter = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        minimumSize: Size(double.infinity, buttonHeight ?? 60),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            number.toString(),
            style: TextStyle(
              color: fontColor,
              fontSize: numFontSize,
              fontWeight: numFontWeight,
              height: numFontHeight,
            ),
            textAlign: TextAlign.center,
          ),
          if (isShowLetter!)
          Text(
            letter,
            style: TextStyle(
              color: fontColor,
              fontSize: letterFontSize,
              fontWeight: FontWeight.w700,
              height: letterFontHeight,
              letterSpacing: 1.8,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
