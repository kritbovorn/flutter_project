// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_project/components/dark_keyboard.dart';
import 'package:flutter_project/models/keyboard_model.dart';

class DarkKeyboardWidget extends StatelessWidget {
  final List<KeyboardModel> models;
  const DarkKeyboardWidget({
    Key? key,
    required this.models,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
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
                  return DarkKeyboard(
                    number: models[index].number,
                    letter: models[index].letter,
                    isActive: models[index].isActive,
                    isShowIconButton: models[index].isShowIconButton,
                    isShowLetter: models[index].isShowLetter,
                    onPressed: () {
                      debugPrint(index.toString());
                    },
                  );
                },
              ),
            );
  }
}
