import 'package:flutter/material.dart';
import 'package:flutter_project/change_notifier_provider/counter_notifier.dart';
import 'package:flutter_project/change_notifier_provider/next_screen.dart';
import 'package:provider/provider.dart';

class ChangeNotifierProviderScreen extends StatelessWidget {
  const ChangeNotifierProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final counterNotifierNoChange = Provider.of<CounterNotifier>(context, listen: false); // *** Listen to false: not Update UI
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangeNotifierProvider Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: context.read<CounterNotifier>().decrease,
                  child: Text('${context.watch<CounterNotifier>().number}'),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Decrease',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: context.read<CounterNotifier>().increase,
                  child: Text('${context.watch<CounterNotifier>().number}'),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Increase',
                  style: Theme.of(context).textTheme.headline5,
                )
              ],
            ),
            Consumer<CounterNotifier>(
              builder: (context, value, child) => Text(
                '${value.number}',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Consumer<CounterNotifier>(
              builder: (context, value, child) => ElevatedButton(
                onPressed: value.increase,
                // child: const Text('Increase'),
                child: Text('Increase : ${value.number}'),
              ),
            ),
            ElevatedButton(
              // onPressed: counterNotifierNoChange.decrease,
              // child: const Text('Decrease'),
              onPressed: () => context.read<CounterNotifier>().decrease(),
              child:
                  Text('Decrease: ${context.read<CounterNotifier>().number}'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NextScreen(),
                ),
              ),
              child: const Text('Go to Next Page'),
            ),
          ],
        ),
      ),
    );
  }
}
