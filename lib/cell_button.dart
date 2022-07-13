import 'package:flutter/material.dart';

class CellButton {
  int id;
  String? title;
  Color? backgroundColor;
  bool? enable;
  CellButton({
    required this.id,
    this.title = "",
    this.backgroundColor = Colors.grey,
    this.enable = true,
  });
}
