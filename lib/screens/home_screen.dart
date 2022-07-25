// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  const HomeScreen({
    Key? key,
    required this.title,
    this.titleColor,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.green,
          ),
        ),
        Expanded(
          child: SizedBox(
            child: LayoutBuilder(
              builder: (context, constraints) {
                var pw = constraints.maxWidth * 0.05;
                double font = constraints.maxHeight * 0.8;
                return FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: pw, vertical: pw),
                    color: Colors.red,
                    child: Text(
                      'Somethings',
                      style: TextStyle(
                        color: titleColor,
                        fontSize: fontSize ?? font,
                        fontWeight: fontWeight,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
