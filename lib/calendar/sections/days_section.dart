// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_project/calendar/calendar_screen.dart';

class DaysSection extends StatefulWidget {
  final List<int> d;
  final DateTime now;
  final int dayOfLastMonth;
  final Function(DateTime) updateNow;
  const DaysSection({
    Key? key,
    required this.d,
    required this.now,
    required this.dayOfLastMonth,
    required this.updateNow,
  }) : super(key: key);

  @override
  State<DaysSection> createState() => _DaysSectionState();
}

class _DaysSectionState extends State<DaysSection> {
  // *? ประกาศ selectedDateIndex
  late int selectedDateIndex;
  // *   BBB ถ้าค่า  isNull  เป็นจริง  ปุ่มจะคลิกไม่ได้
  bool isNull = false;
  // *!   AAAAA   ประกาศ updateDateTime ขึ้นมารับค่า DateTime ใหม่ ที่เลือก
  DateTime updateDateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    selectedDateIndex = widget.now.day;
  }

  Color backgroundSelected(int index) {
    Color backgroundSelect = selectedDateIndex == index
        ? dateSelectedBackgroundColor
        : Colors.transparent;
    return backgroundSelect;
  }

  Color colorSelected(int index) {
    Color colorSelect = selectedDateIndex == index ? Colors.white : dateColor;
    return colorSelect;
  }

  String getIndexToString(int index) {
    String result = '';
    if (index == 0) {
      result = "";
      return result;
    }
    return index.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 11,
      child: SizedBox(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double main = (constraints.maxHeight / 6);
            double pw = (constraints.maxWidth * 0.03);
            return GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: pw),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                crossAxisSpacing: 3,
                mainAxisExtent: main,
              ),
              itemCount: widget.d.length,
              itemBuilder: (BuildContext context, int index) {
                int i = index + 1 - widget.dayOfLastMonth;
                if (i < 1) {
                  i = 0;
                  isNull = true;
                } else {
                  isNull = false;
                }
                return TextButton(
                  onPressed: isNull
                      ? null
                      : () {
                          // DateTime newDateTime = widget.now;
                          setState(() {
                            selectedDateIndex = i;
                            // *!  AAAAA   มารับค่า ที่นี่
                            // updateDateTime = DateTime.utc(
                            //   newDateTime.year,
                            //   newDateTime.month,
                            //   i,
                            // );
                            updateDateTime =
                                DateTime(widget.now.year, widget.now.month, i);
                            widget.updateNow(updateDateTime);
                          });
                        },
                  style: TextButton.styleFrom(
                    onSurface: Colors.transparent,
                    backgroundColor: backgroundSelected(i),
                    shape: const CircleBorder(),
                  ),
                  child: Text(
                    getIndexToString(i),
                    style: TextStyle(
                      color: colorSelected(i),
                      fontSize: 14,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
