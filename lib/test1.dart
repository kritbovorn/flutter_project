import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/bottom_content_widget.dart';
import 'package:flutter_project/widgets/code_content_widget.dart';
import 'package:flutter_project/widgets/form_field_content_widget.dart';

class Test1 extends StatelessWidget {
  const Test1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/logo.png'),
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Column(
                        children: const [
                          FormFieldContentWidget(),
                          CodeContentWidget(),
                        ],
                      ),
                    ),
                    const BottomContentWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
