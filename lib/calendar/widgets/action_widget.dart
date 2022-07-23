import 'package:flutter/material.dart';
import 'package:flutter_project/calendar/calendar_screen.dart';
import 'package:flutter_project/calendar/components/action_button.dart';

class ActionWidget extends StatelessWidget {
  const ActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ActionButton(
              onPressed: () {
                debugPrint('ยกเลิก');
              },
              title: 'ยกเลิก',
              fontColor: cancelButtonColor,
            ),
          ),
          Expanded(
              flex: 1,
              child: ActionButton(
                onPressed: () {
                  debugPrint('ตกลง');
                },
                title: 'ตกลง',
              )),
        ],
      ),
    );
  }
}
