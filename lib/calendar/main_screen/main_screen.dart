// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final DateTime currentDateTime;
  final DateTime now;
  final List<int> allDays;
  final List<int> allDaysInMonth;
  final int lastDateOfLastMonthInWeek;
  const MainScreen({
    Key? key,
    required this.currentDateTime,
    required this.now,
    required this.allDays,
    required this.allDaysInMonth,
    required this.lastDateOfLastMonthInWeek,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isNull = false;
  bool isSelect = true;
  late int selectedDateIndex;
  late final int current;

  @override
  void initState() {
    super.initState();
    current = widget.now.day;
    selectedDateIndex = widget.now.day;
  }

  // *?  สีของ Border
  Color getBorderCircleCurrentTime(int index) {
    if (widget.currentDateTime.day == current &&
        selectedDateIndex == index &&
        isSelect == true) {
      debugPrint('MainScreen : Line #41 ::: Current : $current');
      return Colors.red;
    } else {
      return Colors.transparent;
      // return Colors.black;
    }
  }

  Color backgroundSelected(int index) {
    Color backgroundSelect =
        selectedDateIndex == index ? Colors.red : Colors.transparent;
    if (widget.currentDateTime.month != widget.now.month) {
      backgroundSelect = Colors.black;
    }
    return backgroundSelect;
  }

  Color colorSelected(int index) {
    Color colorSelect = selectedDateIndex == index
        ? Colors.white
        : const Color.fromARGB(255, 119, 99, 174);
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
                  if (current == i) {
                    isSelect = true;
                  } else {
                    isSelect = false;
                  }

                  return TextButton(
                    onPressed: isNull
                        ? null
                        : () {
                            setState(() {
                              isSelect = false;
                              selectedDateIndex = i;
                            });
                          },
                    style: TextButton.styleFrom(
                        backgroundColor: backgroundSelected(i),
                        shape: CircleBorder(
                          side: BorderSide(
                              color: isSelect ? Colors.red : Colors.transparent,
                              width: 2),
                        )),
                    child: Text(
                      getIndexToString(i),
                      style: TextStyle(
                        color: colorSelected(i),
                      ),
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
