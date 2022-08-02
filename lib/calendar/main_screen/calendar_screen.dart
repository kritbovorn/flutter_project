// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_project/calendar/constants/constant.dart';
import 'package:flutter_project/calendar/sections/week_section.dart';

class CalendarScreen extends StatefulWidget {
  // *!                               รับ ค่า currentDateTime:  ซึ่ง   เป็นค่า DateTime    ตอนแรกสุด  เพือมาเปรียบเทียบ
  final DateTime currentDateTime;
  final DateTime now;
  final List<int> allDays;
  final List<int> allDaysInMonth;
  final int lastDateOfLastMonthInWeek;
  final Function(DateTime) getNewNow;
  const CalendarScreen({
    Key? key,
    required this.currentDateTime,
    required this.now,
    required this.allDays,
    required this.allDaysInMonth,
    required this.lastDateOfLastMonthInWeek,
    required this.getNewNow,
  }) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  bool isNull = false;
  bool isSelect = true;
  late int selectedDateIndex;
  late final int current;
  late DateTime newNow;
  late final DateTime defaultNow;

  @override
  void initState() {
    super.initState();
    defaultNow = DateTime.now();
    // *!                               สำคัญ  สร้างเพื่อ ไม่ให้   current   เปลี่ยนค่า
    current = defaultNow.day;
    selectedDateIndex = widget.now.day;

    // *!                               สำคัญ  เพือรับค่า  DateTime ใหม่  แล้วส่ง ออกไป
    newNow =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  }

  Color backgroundSelected(int index) {
    Color backgroundSelect =
        selectedDateIndex == index ? Constant.mainColor : Colors.transparent;
    return backgroundSelect;
  }

  Color colorSelected(int index) {
    Color colorSelect =
        selectedDateIndex == index ? Colors.white : Constant.primaryColor;
    return colorSelect;
  }

  // *?  Method  หาค่า String  ที่พิมพ์ใน  ปุ่ม Button
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
    return Column(
      children: [
        const Expanded(
          flex: 3,
          child: WeekSection(),
        ),
        Expanded(
          flex: 18,
          child: LayoutBuilder(
            builder: (context, constraints) {
              double w = constraints.maxWidth;
              double h = constraints.maxHeight;
              double padding = w * 0.03;
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: padding),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisExtent: (h.toInt() / 6),
                ),
                // *?                               เช็ค จำนวน   index
                itemCount: widget.lastDateOfLastMonthInWeek == 7
                    ? widget.allDaysInMonth.length
                    : widget.allDays.length,
                itemBuilder: (BuildContext context, int index) {
                  int i;
                  // *!   สำคัญมาก
                  // *?   ถ้า lastDateOfLastMonthInWeek  ไม่เท่ากับ 7
                  widget.lastDateOfLastMonthInWeek == 7
                      ? i = index + 1
                      : i = index + 1 - widget.lastDateOfLastMonthInWeek;

                  if (i < 1) {
                    i = 0;
                    isNull = true;
                  } else {
                    isNull = false;
                  }
                  // ignore: todo
                  // TODO:                            สำคัญมาก   เช็คว่า  ค่า DateTime  เป็น ตอนแรกไหม   และ   index  ต้องเท่ากับ วันๆแรกด้วย
                  // *?                               เพื่อไป   กำหนดสี ให้กับ   ปุ่ม
                  if (widget.currentDateTime.year == widget.now.year &&
                      widget.currentDateTime.month == widget.now.month) {
                    if (current == i) {
                      isSelect = true;
                    } else {
                      isSelect = false;
                    }
                  } else {
                    // selectedDateIndex = 32;
                    isSelect = false;
                  }
                  // *!                               ปุ่ม  วันที่   1, 2, 3, 4, 5......
                  return TextButton(
                    onPressed: isNull
                        ? null
                        : () {
                            setState(() {
                              isSelect = false;
                              selectedDateIndex = i;

                              newNow = DateTime(
                                  widget.now.year, widget.now.month, i);
                              widget.getNewNow(newNow);
                            });
                          },
                    style: TextButton.styleFrom(
                        backgroundColor: backgroundSelected(i),
                        shape: CircleBorder(
                          side: BorderSide(
                              // *!                               isSelect   รับค่ามาจาก
                              color: isSelect ? Colors.red : Colors.transparent,
                              width: 2),
                        )),
                    child: Text(
                      getIndexToString(i),
                      style: TextStyle(
                        fontSize: 16,
                        color: colorSelected(i),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        // *!                               Cancel     Ok   button
        Expanded(
          flex: 4,
          child: Row(
            children: [
              const Expanded(
                child: SizedBox.shrink(),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      // *!                               Cancel
                      child: TextButton(
                        onPressed: () async {
                          Navigator.pop(context, widget.currentDateTime);
                        },
                        child: Text(
                          'ยกเลิก',
                          style: TextStyle(
                            color: Constant.mainColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        // *!                               Ok
                        child: TextButton(
                      onPressed: () async {
                        setState(() {
                          Navigator.pop(context, widget.now);
                        });
                      },
                      child: Text(
                        'ตกลง',
                        style: TextStyle(
                          color: Constant.mainColor,
                          fontSize: 18,
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
