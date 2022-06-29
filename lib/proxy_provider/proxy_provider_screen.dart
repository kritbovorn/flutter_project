import 'package:flutter/material.dart';
import 'package:flutter_project/proxy_provider/credit_card.dart';
import 'package:flutter_project/proxy_provider/customer.dart';
import 'package:provider/provider.dart';

class ProxyProviderScreen extends StatelessWidget {
  const ProxyProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proxy Provider Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CreditCard>(
              builder: (context, value, child) =>
                  Text('Amount: ${value.amount}'),
            ),
            Consumer<CreditCard>(
              builder: (context, value, child) => ElevatedButton(
                onPressed: () => value.deposit(10),
                child: const Text('Depost'),
              ),
            ),
            Consumer<Customer>(
              builder: (context, value, child) => ElevatedButton(
                onPressed: () => value.withdraw(10),
                child: const Text('Withdraw'),
              ),
            ),
            Consumer<Customer>(
              builder: (context, value, child) =>
                  Text('Number of Credit card is: ${value.numOfCreditCard}'),
            ),
            Consumer<Customer>(
              builder: (context, value, child) => ElevatedButton(
                onPressed: value.applyNewCreditCard,
                child: const Text('Apply'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
