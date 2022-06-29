import 'package:flutter/material.dart';

class CreditCard with ChangeNotifier {
  int amount = 0;

  void deposit(int amount) {
    this.amount += amount;
    notifyListeners();
  }

  void withdraw(int amount) {
    this.amount -= amount;
    notifyListeners();
  }
}
