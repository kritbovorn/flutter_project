import 'package:flutter/material.dart';
import 'package:flutter_project/stream_provider/data.dart';
import 'package:provider/provider.dart';

class StreamProviderScreen extends StatelessWidget {
  const StreamProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${context.watch<ModelStream>().number}',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Consumer<ModelStream>(
              builder: (context, value, child) => ElevatedButton(
                onPressed: value.increase,
                child: const Text('Increase'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
