import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: NetworkImage(
                    "https://media.istockphoto.com/photos/sound-wave-picture-id1287065554?k=20&m=1287065554&s=612x612&w=0&h=uWKAJ2Uws2NYo2Ov3kC8LJvAbTSRKyIfCSUaNSzVUPI="),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset('assets/logo.png'),
                ),
                const Expanded(
                  child: SizedBox.shrink(),
                )
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
