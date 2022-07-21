// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_project/keyboard/keyboard_component/dark_keyboard_component.dart';
import 'package:flutter_project/keyboard/keyboard_model/keyboard_model.dart';

class DarkKeyboardWidget extends StatelessWidget {
  final List<KeyboardModel> models;
  final Function(String) values;
  final bool hasShowIcon;
  final bool hasActive;
  const DarkKeyboardWidget({
    Key? key,
    required this.models,
    required this.values,
    required this.hasShowIcon,
    required this.hasActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String result = '';
    return Container(
      padding: const EdgeInsets.all(8),
      color: const Color(0xFF323234),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 6,
          mainAxisSpacing: 8,
          mainAxisExtent: 55,
        ),
        itemCount: models.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 11) {
            models[index].isActive = hasActive;
            models[index].isShowIconButton = hasShowIcon;
          }
          return DarkKeyboardComponent(
            number: models[index].number,
            letter: models[index].letter,
            isActive: models[index].isActive,
            isShowIconButton: models[index].isShowIconButton,
            isShowLetter: models[index].isShowLetter,
            onPressed: () {
              result = models[index].isShowLetter
                  ? result = "${index + 1}"
                  : models[index].isShowIconButton
                      ? result = "remove"
                      : result = "${index - index}";
              values(result);
            },
          );
        },
      ),
    );
  }
}
