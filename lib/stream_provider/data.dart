import 'package:flutter/material.dart';

class ModelStream {
  int number;
  ModelStream({
    required this.number,
  });

  void increase() {
    number++;
     debugPrint('$number');
  }
}
