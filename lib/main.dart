// https://www.youtube.com/watch?v=t_i5_QHalvk&list=PLgGlvOHs_ZdABf3vwR4GeJZbAyfQzTr9O&index=2

import 'package:flutter/material.dart';
import 'package:flutter_project/change_notifier_provider/counter_notifier.dart';
import 'package:flutter_project/future_provider/data.dart';
import 'package:flutter_project/future_provider/data_future.dart';
import 'package:flutter_project/stream_provider/data.dart';
import 'package:flutter_project/stream_provider/data_stream.dart';
import 'package:flutter_project/stream_provider/stream_provider_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 1.
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   // home: Provider<Counter>(
    //   //   create: (context) => Counter(),
    //   //   child: const ProviderScreen(),
    //   // ),
    //   home: ChangeNotifierProvider(
    //     // 1. Use ChangeNotifierProvider()
    //     create: (context) => CounterNotifier(), // 2.  Return Class
    //     child: const ChangeNotifierProviderScreen(), // 3. Add Screen child
    //   ),
    // );
    // 2. --- ChangeNotifier Provider
    // return ChangeNotifierProvider(
    //   create: (context) => CounterNotifier(),
    //   child: const MaterialApp(
    //     home: ChangeNotifierProviderScreen(),
    //   ),
    // );
    // 3. --- Future Provider
    // return FutureProvider<Data>(
    //   initialData: Data(data: 'Initial Data'),
    //   create: (_) => loadDataFuture(),
    //   child: const MaterialApp(
    //     home: FutureProviderScreen(),
    //   ),
    // );
    // 4. --- Stream Provider
    // return StreamProvider<ModelStream>(
    //   initialData: ModelStream(number: 0),
    //   create: (_) => loadedStream(),
    //   child: const MaterialApp(
    //     home: StreamProviderScreen(),
    //   ),
    // );
    // 5. --- Nest Provider
    return ChangeNotifierProvider<CounterNotifier>(
      create: (context) => CounterNotifier(),
      child: FutureProvider<Data>(
        initialData: Data(data: 'Initial Data'),
        create: (context) => loadDataFuture(),
        child: StreamProvider(
          initialData: ModelStream(number: 0),
          create: (context) => loadedStream(),
          child: const MaterialApp(
            // home: ChangeNotifierProviderScreen(),
            // home: FutureProviderScreen(),
            home: StreamProviderScreen(),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
