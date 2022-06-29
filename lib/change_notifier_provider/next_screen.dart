import 'package:flutter/material.dart';
import 'package:flutter_project/change_notifier_provider/counter_notifier.dart';
import 'package:provider/provider.dart';

class NextScreen extends StatelessWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: context.read<CounterNotifier>().increase,
              child: Text(
                '+++ ${context.watch<CounterNotifier>().number}',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            ElevatedButton(
              onPressed: context.read<CounterNotifier>().decrease,
              child: Text(
                '--- ${context.watch<CounterNotifier>().number}',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Consumer<CounterNotifier>(
              builder: (context, value, child) => Text('${value.number}'),
            ),
            Consumer<CounterNotifier>(
              builder: (context, value, child) => ElevatedButton(
                onPressed: value.increase,
                child: const Text('Increase'),
              ),
            ),
            Consumer<CounterNotifier>(
              builder: (context, value, child) => ElevatedButton(
                onPressed: value.decrease,
                child: const Text('Decrease'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
