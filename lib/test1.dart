import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/widgets/bottom_widget.dart';
import 'package:flutter_project/widgets/logo_widget.dart';

class Test1 extends StatelessWidget {
  const Test1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: NetworkImage(
                  "https://media.istockphoto.com/photos/sound-wave-picture-id1287065554?k=20&m=1287065554&s=612x612&w=0&h=uWKAJ2Uws2NYo2Ov3kC8LJvAbTSRKyIfCSUaNSzVUPI="),
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: Column(
              children: const [
                Expanded(
                  child: LogoWidget(),
                ),
                BottomWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
