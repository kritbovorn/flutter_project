// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_project/button/button_widget.dart';
import 'package:flutter_project/text/text_widget.dart';

class ContainerSex extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isSex;
  const ContainerSex({
    Key? key,
    required this.onPressed,
    required this.isSex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 108, 147, 44),
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const TextWidget(title: 'With Icon'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const TextWidget(title: 'Sex:'),
              Stack(
                alignment: isSex ? Alignment.centerRight : Alignment.centerLeft,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 226, 226, 226),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    width: 260,
                    height: 60,
                  ),
                  Row(
                    children: [
                      ButtonWidget(
                        iconData: Icons.woman,
                        title: 'Female',
                        onPressed: onPressed,
                      ),
                      ButtonWidget(
                        iconData: Icons.man,
                        title: 'Male',
                        onPressed: onPressed,
                      ),
                    ],
                  ),
                  ButtonWidget(
                    primaryColor: const Color.fromARGB(255, 22, 84, 135),
                    iconData: isSex ? Icons.man : Icons.woman,
                    title: isSex ? 'Male' : 'FeMale',
                    onPressed: () {},
                    iconColor: Colors.white,
                    textColor: Colors.white,
                  ),
                ],
              )
            ],
          ),
          TextWidget(
              title: isSex ? 'Selected sex: Male' : 'Selected sex: Female'),
        ],
      ),
    );
  }
}
