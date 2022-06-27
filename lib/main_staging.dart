import 'package:flutter/material.dart';
import 'package:flutter_project/flavor.dart';
import 'package:flutter_project/my_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    Provider<Flavor>.value(
      value: Flavor.staging,
      child: const MyApp(),
    ),
  );
}
