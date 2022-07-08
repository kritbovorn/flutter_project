import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<int?> getData() async {
    try {
      await Future.delayed(const Duration(seconds: 4));
    } catch (e) {
      throw '$e';
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<int?>(
          future: getData(),
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
    );
  }
}
