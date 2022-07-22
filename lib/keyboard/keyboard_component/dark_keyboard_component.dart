import 'package:flutter/material.dart';

class DarkKeyboardComponent extends StatelessWidget {
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
  final bool isActive;
  final bool isShowIconButton;
  const DarkKeyboardComponent({
    Key? key,
    required this.number,
    required this.letter,
    this.fontColor = const Color(0xFFF6F6F6),
    this.primaryColor = const Color(0xFF6B6B6B),
    this.numFontSize = 28,
    this.letterFontSize = 10,
    this.numFontHeight = 1,
    this.numFontWeight = FontWeight.w600,
    this.letterFontWeight = FontWeight.w500,
    this.letterFontHeight = 1.5,
    this.buttonHeight,
    required this.onPressed,
    required this.isShowLetter,
    required this.isActive,
    required this.isShowIconButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isShowIconButton
        ? ElevatedButton.icon(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFF323234),
              onPrimary: Theme.of(context).colorScheme.onPrimary,
              elevation: 0,
            ),
            icon: const Icon(
              Icons.backspace_outlined,
              color: Color(0xFFFEFEFE),
            ),
            label: const Text(""))
        : ElevatedButton(
            onPressed: isActive ? onPressed : null,
            style: ElevatedButton.styleFrom(
              onPrimary: Theme.of(context).colorScheme.onPrimary,
              primary: primaryColor,
              onSurface: const Color(0xFF323234),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              minimumSize: Size(double.infinity, buttonHeight ?? 55),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
