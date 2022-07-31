// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final DateTime now;
  final List<int> allDays;
  final List<int> allDaysInMonth;
  final int lastDateOfLastMonthInWeek;
  const MainScreen({
    Key? key,
    required this.now,
    required this.allDays,
    required this.allDaysInMonth,
    required this.lastDateOfLastMonthInWeek,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late DateTime updateDateTime;
  bool isNull = false;
  late int selectedDateIndex;

  @override
  void initState() {
    super.initState();
    updateDateTime = DateTime.now();
    selectedDateIndex = widget.now.day;
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
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.green,
          ),
        ),
        Expanded(
          flex: 18,
          child: LayoutBuilder(
            builder: (context, constraints) {
              double w = constraints.maxWidth;
              double h = constraints.maxHeight;
              double p = w * 0.01;
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: p, vertical: p),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisExtent: (h.toInt() / 6),
                ),
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

                  return TextButton(
                    onPressed: isNull
                        ? null
                        : () {
                            setState(() {
                              selectedDateIndex = i;
                            });
                          },
                    child: Text(
                      getIndexToString(i),
                    ),
                  );
                },
              );
            },
          ),
        ),
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
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('ยกเลิก'),
                      ),
                    ),
                    Expanded(
                        child: TextButton(
                      onPressed: () {},
                      child: const Text('ตกลง'),
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
