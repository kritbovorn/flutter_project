import 'package:flutter/material.dart';
import 'package:flutter_project/flavor.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flavor = Provider.of<Flavor>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(flavor.toString()),
      ),
      body: Center(
        child: Text(
          'Somethings',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
