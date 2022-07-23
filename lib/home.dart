// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_project/button_selected.dart';

class ModelSex {
  int id;
  String name;
  IconData iconData;
  bool isPress;
  ModelSex({
    required this.id,
    required this.name,
    required this.iconData,
    required this.isPress,
  });
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ModelSex> models = [
    ModelSex(id: 1, name: "Male", iconData: Icons.man, isPress: true),
    ModelSex(id: 2, name: "Female", iconData: Icons.woman, isPress: false),
  ];
  @override
  Widget build(BuildContext context) {
    bool isPressing = true;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 56, 34, 34),
      ),
      body: Center(
        child: Container(
          width: 250,
          height: 60,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 226, 226, 226),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: models
                .map((e) => ButtonSelected(
                    name: e.name,
                    iconData: e.iconData,
                    isPress: e.isPress,
                    onPressed: () {
                     
                      //  กลับมาทำใหม่
                    }))
                .toList(),
          ),
        ),
      ),
    );
  }
}
