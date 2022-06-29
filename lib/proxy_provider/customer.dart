// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_project/proxy_provider/credit_card.dart';

class Customer {
  CreditCard? creditCard;
  int numOfCreditCard = 1;
  Customer({
    this.creditCard,
  });

  void deposit(int amount) {
    creditCard?.deposit(amount);
  }

  void withdraw(int amount) {
    creditCard?.withdraw(amount);
  }

  void applyNewCreditCard() {
    numOfCreditCard += 1;
     debugPrint('Number of Credit Card is: $numOfCreditCard');
  }
}
