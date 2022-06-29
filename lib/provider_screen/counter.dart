import 'package:flutter/material.dart';

class Counter {
  int number = 0;

  void increase() {
    number++;
    debugPrint('$number');
  }

  void decrease() {
    number--;
    debugPrint('$number');
  }
}
