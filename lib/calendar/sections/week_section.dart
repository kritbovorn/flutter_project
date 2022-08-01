import 'package:flutter/material.dart';
import 'package:flutter_project/calendar/constants/constant.dart';

class WeekSection extends StatelessWidget {
  const WeekSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> week = ['อา', 'จ', 'อ', 'พ', 'พฤ', 'ศ', 'ส'];
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double padding = constraints.maxWidth * 0.03;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                week.length,
                (index) => Center(
                  child: Text(
                    week[index],
                    style:
                        TextStyle(fontSize: 16, color: Constant.secondaryColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
