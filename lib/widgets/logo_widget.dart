import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: FractionallySizedBox(
        // heightFactor: 0.5,
        widthFactor: 0.5,
        child: Image.asset('assets/logo.png'),
      ),
    );
  }
}
