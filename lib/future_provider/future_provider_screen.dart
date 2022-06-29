import 'package:flutter/material.dart';
import 'package:flutter_project/future_provider/data.dart';
import 'package:provider/provider.dart';

class FutureProviderScreen extends StatelessWidget {
  const FutureProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.watch<Data>().data,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Consumer<Data>(
              builder: (context, value, child) => ElevatedButton(
                onPressed: value.loadedData,
                child: const Text(
                  'Loaded Data',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
