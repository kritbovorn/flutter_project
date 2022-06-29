import 'package:flutter/material.dart';
import 'package:flutter_project/change_notifier_provider/counter_notifier.dart';
import 'package:flutter_project/future_provider/data.dart';
import 'package:flutter_project/stream_provider/data.dart';
import 'package:provider/provider.dart';

class MultiProviderScreen extends StatelessWidget {
  const MultiProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi Provider Screen'),
      ),
      body: Center(
        child: Consumer3<CounterNotifier, Data, ModelStream>(
          builder: (context, value, value2, value3, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${value.number}',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                value2.data,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                '${value3.number}',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
