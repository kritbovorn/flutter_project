import 'package:flutter/material.dart';

class YearWidget extends StatelessWidget {
  const YearWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 221, 221),
      body: Center(
        child: Column(
          children: [
            Text(
              'Center',
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
      ),
    );
  }
}

// ทำปุ่ม Animation
// Show Year: GridView builder