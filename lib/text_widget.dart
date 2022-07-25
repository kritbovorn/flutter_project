// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final double? height;
  final Color? titleColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final num? padding;
  const TextWidget({
    Key? key,
    required this.title,
    this.height,
    this.titleColor,
    this.fontSize,
    this.fontWeight,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          var pw = constraints.maxWidth * (padding ?? 0.02);
          double font = constraints.maxHeight;
          return FittedBox(
            fit: BoxFit.fitHeight,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: pw, vertical: 0.0001),
              color: Colors.red,
              child: Text(
                title,
                style: TextStyle(
                  color: titleColor ?? Colors.black,
                  fontSize: font,
                  fontWeight: fontWeight,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
