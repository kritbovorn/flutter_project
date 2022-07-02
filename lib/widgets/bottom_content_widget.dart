import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/second_title_in_row.dart';

class BottomContentWidget extends StatelessWidget {
  const BottomContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom,
        left: 28,
        right: 28,
      ),
      height:
          kBottomNavigationBarHeight + MediaQuery.of(context).padding.bottom,
      color: Theme.of(context).colorScheme.onPrimaryContainer,
      child: SecondTitleInRow(
        firstTitle: "เข้าสู่ระบบครั้งแรก",
        firstPressed: () {},
        secondTitle: "ลงทะเบียนตัวแทนเติมเงิน",
        secondPressed: () {},
      ),
    );
  }
}
