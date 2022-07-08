import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<int?> dataFuture;

  @override
  void initState() {
    super.initState();
    dataFuture = getData();
  }

  Future<int?> getData() async {
    try {
      http.Response response = await http.get(
        Uri.parse('https://randomnumberapi.com/api/v1.0/random'),
      );
      final data = jsonDecode(response.body);
      int randomNumber = (data as List).first;
      return randomNumber;
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<int?>(
          future: dataFuture,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              final error = snapshot.error;
              return Text(
                '😵‍💫 $error',
                style: Theme.of(context).textTheme.headline5,
              );
            } else if (snapshot.hasData) {
              int data = snapshot.data!;
              return Text(
                '🏈 $data',
                style: Theme.of(context).textTheme.headline5,
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () => setState(() => {
              SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                dataFuture = getData();
              })
            }),
      ),
    );
  }
}
