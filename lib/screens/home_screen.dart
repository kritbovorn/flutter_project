// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_project/text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
            height: 30,
            child: TextWidget(
              title: 'Hello World',
            )),
        const Text('Boie'),
        const TextWidget(
          title: 'Oksssss',
          // height: 24,
        ),
        const SizedBox(
          height: 200,
          child: TextWidget(title: 'Third '),
        ),
        Container(
            // width: 250,
            height: 120,
            color: Colors.indigo,
            child: const TextWidget(
              title: 'Somethings',
              // fontSize: 8,
            )),
      ],
    );
  }
}
