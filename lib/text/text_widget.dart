import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;
  const TextWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headline4!
          .copyWith(color: Colors.white70),
    );
  }
}
