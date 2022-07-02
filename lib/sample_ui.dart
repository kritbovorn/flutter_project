import 'package:flutter/material.dart';

class SampleUi extends StatelessWidget {
  const SampleUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 199, 36, 69),
      body: Column(
        children: [
          const Expanded(
            child: SizedBox.shrink(),
          ),
          Image.asset('assets/logo1.JPG'),
          Container(
            height: MediaQuery.of(context).padding.bottom,
            color: const Color.fromARGB(255, 150, 12, 31),
          ),
        ],
      ),
    );
  }
}
