import 'package:flutter/material.dart';
import 'package:flutter_project/provider_screen/counter.dart';
import 'package:provider/provider.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<Counter>(
              builder: (context, value, child) => Text(
                '${value.number}',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Consumer<Counter>(
              builder: (context, value, child) => ElevatedButton(
                onPressed: value.increase,
                child: const Text('Increase'),
              ),
            ),
            Consumer<Counter>(
              builder: (context, value, child) => ElevatedButton(
                onPressed: value.decrease,
                child: const Text('Decrease'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
