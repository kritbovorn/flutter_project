import 'package:flutter/material.dart';
import 'package:flutter_project/button_widget.dart';
import 'package:flutter_project/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSelect = true;
  bool isPressed = true;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 56, 34, 34),
        elevation: 0,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(0),
          width: screenSize.width * 0.9,
          height: screenSize.height * 0.5,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 57, 38, 38),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const TextWidget(
                title: 'With Icon',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const TextWidget(title: 'Sex'),
                  Container(
                    width: 220,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 226, 226, 226),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        ButtonWidget(
                          primaryColor: isSelect
                              ? const Color.fromARGB(255, 61, 25, 179)
                              : const Color.fromARGB(255, 226, 226, 226),
                          iconColor: isSelect
                              ? const Color.fromARGB(255, 226, 226, 226)
                              : const Color.fromARGB(255, 61, 25, 179),
                          textColor: isSelect
                              ? const Color.fromARGB(255, 226, 226, 226)
                              : const Color.fromARGB(255, 61, 25, 179),
                          iconData: Icons.man,
                          title: 'Male',
                          onPressed: () {
                            if (!isPressed) {
                              setState(() {
                                isSelect = !isSelect;
                                isPressed = true;
                              });
                            }
                          },
                        ),
                        ButtonWidget(
                            primaryColor: !isSelect
                                ? const Color.fromARGB(255, 61, 25, 179)
                                : const Color.fromARGB(255, 226, 226, 226),
                            iconColor: !isSelect
                                ? const Color.fromARGB(255, 226, 226, 226)
                                : const Color.fromARGB(255, 61, 25, 179),
                            textColor: !isSelect
                                ? const Color.fromARGB(255, 226, 226, 226)
                                : const Color.fromARGB(255, 61, 25, 179),
                            iconData: Icons.woman,
                            title: 'FeMale',
                            onPressed: () {
                              if (isPressed) {
                                setState(() {
                                  isSelect = !isSelect;
                                  isPressed = false;
                                });
                              }
                            }),
                      ],
                    ),
                  ),
                ],
              ),
              const TextWidget(title: 'Selected sex: Female'),
            ],
          ),
        ),
      ),
    );
  }
}
