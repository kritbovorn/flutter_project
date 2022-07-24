// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ModelSex {
  String name;
  IconData iconData;
  ModelSex({
    required this.name,
    required this.iconData,
  });
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ModelSex> models = [
    ModelSex(name: "Male", iconData: Icons.man),
    ModelSex(name: "Female", iconData: Icons.woman),
  ];

  int selectedIndex = 0;
  Color backgroundSelected(int index) {
    Color backgroundSelect = selectedIndex == index
        ? Colors.blue
        : const Color.fromARGB(255, 226, 226, 226);

    return backgroundSelect;
  }

  Color colorSelected(int index) {
    Color colorSelect = selectedIndex == index
        ? const Color.fromARGB(255, 226, 226, 226)
        : Colors.blue;

    return colorSelect;
  }

  @override
  Widget build(BuildContext context) {
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
              children: models.asMap().entries.map((e) {
                var value = e.value;
                var index = e.key;
                return Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double width = constraints.maxWidth;
                      double height = constraints.maxHeight;
                      return SizedBox(
                        width: width,
                        height: height,
                        child: ElevatedButton.icon(
                          icon: Icon(
                            value.iconData,
                            color: colorSelected(index),
                          ),
                          label: Text(
                            value.name,
                            style: TextStyle(
                              color: colorSelected(index),
                              fontSize: 16,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: backgroundSelected(index),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              )),
                          onPressed: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ));
  }
}
