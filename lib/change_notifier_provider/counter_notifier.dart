import 'package:flutter/material.dart';

class CounterNotifier with ChangeNotifier {
  int number = 0;

  void increase() {
    number++;
    notifyListeners();
  }

  void decrease() {
    number--;
    notifyListeners();
  }
}
