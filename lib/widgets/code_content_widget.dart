import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/code_second_title_in_row.dart';

class CodeContentWidget extends StatelessWidget {
  const CodeContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kBottomNavigationBarHeight,
      child: CodeSecondTitleInRow(
        firstTitle: "ลืมรหัสผ่าน",
        firstPressed: () {},
        secondTitle: "เปลี่ยนรหัสผ่าน",
        secondPressed: () {},
      ),
    );
  }
}
