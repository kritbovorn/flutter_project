import 'dart:math';

import 'package:flutter/material.dart';

class TransitionWidget extends StatefulWidget {
  const TransitionWidget({Key? key}) : super(key: key);

  @override
  State<TransitionWidget> createState() => _TransitionWidgetState();
}

class _TransitionWidgetState extends State<TransitionWidget>
    with TickerProviderStateMixin {
  // late final AnimationController _controller =
  //     AnimationController(vsync: this, duration: const Duration(seconds: 2));
  // late final Animation<double> _animation =
  //     CurvedAnimation(parent: _controller, curve: Curves.elasticIn);
  // bool isAnimate = true;

  late final double degrees;
  late final double angle;
  bool isRotate = false;

  @override
  void initState() {
    super.initState();

    degrees = 180;
    angle = degrees * pi / 180;
     debugPrint(pi.toString());
  }

  double rotateDegree(double degree) {
    var angle = degree * pi / 180;
    return angle;
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transition')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              // angle: rotateDegree(45),
              angle: isRotate ? rotateDegree(180) : rotateDegree(0),
              // angle: isRotate ? 90 : 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.access_alarm_outlined,
                    size: 54,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    child: const Text('Animation Me'),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {});
                isRotate = !isRotate;
              },
              child: const Text('Animation Me'),
            ),
          ],
        ),
      ),
    );
  }
}
