import 'package:flutter/material.dart';

class MoreControls extends StatelessWidget {
  const MoreControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.devices_outlined),
          iconSize: 20,
          onPressed: () {},
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.volume_up_outlined),
              onPressed: () {},
            ),
            Container(
              width: 70,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.fullscreen_outlined),
          iconSize: 24,
          onPressed: () {},
        ),
      ],
    );
  }
}
