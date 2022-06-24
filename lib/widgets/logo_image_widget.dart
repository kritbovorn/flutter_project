import 'package:flutter/material.dart';

class LogoImageWidget extends StatelessWidget {
  const LogoImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(
            'spotify_logo.png',
            height: 45,
            filterQuality: FilterQuality.high,
          ),
        ),
      ],
    );
  }
}
