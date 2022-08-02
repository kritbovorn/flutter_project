// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_project/calendar/constants/constant.dart';

class YearScreen extends StatefulWidget {
  final DateTime now;
  final Function(int) sendNewYear;
  final Function(bool) displayYearScreen;
  final Function(DateTime) sendDefaultNow;
  const YearScreen({
    Key? key,
    required this.now,
    required this.sendNewYear,
    required this.displayYearScreen,
    required this.sendDefaultNow,
  }) : super(key: key);

  @override
  State<YearScreen> createState() => _YearScreenState();
}

class _YearScreenState extends State<YearScreen> {
  // late DateTimeRange yearRange;
  late final DateTime defaultNow;
  late List<int> beforeYears;
  late List<int> afterYears;
  late List<int> yearLists;

  late int selectedYearIndex;
  late bool isShowYearScreen;

  // *?  เลือก ระยะ เริ่มต้น และท้ายสุด ของจำนวนปี
  late int startYear;
  late int endYear;

  @override
  void initState() {
    super.initState();
    // *!   ค่า   DateTime   ตอนแรก เปลี่ยนค่าไม่ได้
    defaultNow = widget.now;

    startYear = 2;
    endYear = 5;
    // *!   ตำแหน่งแรก ของปี
    isShowYearScreen = false;

    beforeYears =
        List.generate(startYear, (index) => DateTime.now().year - index)
            .reversed
            .toList();
    afterYears = List.generate(endYear, (index) => DateTime.now().year + index)
      ..removeAt(0);
    yearLists = beforeYears + afterYears;
    debugPrint('YearScreen : Line #26 ::: $yearLists');
    // *? Year
    selectedYearIndex = widget.now.year;
    selectedYearIndex = selectedYearIndex + 543;
  }

  Color backgroundSelected(int index) {
    Color backgroundSelect =
        selectedYearIndex == index ? Constant.mainColor : Colors.white;
    return backgroundSelect;
  }

  Color colorSelected(int index) {
    Color colorSelect =
        selectedYearIndex == index ? Colors.white : Constant.primaryColor;
    return colorSelect;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 21,
          child: LayoutBuilder(
            builder: (context, constraints) {
              double heigh = constraints.maxWidth * 0.15;
              return GridView.builder(
                // padding: EdgeInsets.zero,
                padding: EdgeInsets.symmetric(
                    horizontal: heigh / 2, vertical: heigh / 2),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: heigh / 2,
                  mainAxisSpacing: heigh / 2,
                  mainAxisExtent: heigh,
                ),
                itemCount: yearLists.length,
                itemBuilder: (BuildContext context, int index) {
                  // *!  หาตำแหน่ง ที่ คลิก   และ เริ่มต้น

                  return ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedYearIndex =
                            index + 2021 + 543 - (startYear - 2);

                        widget.sendNewYear(selectedYearIndex);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: selectedYearIndex == yearLists[index] + 543
                          ? Colors.red
                          : Colors.white,
                    ),
                    child: Text(
                      // '${yearLists[index] + 543}',
                      '${yearLists[index] + 543}',

                      style: TextStyle(
                        color: selectedYearIndex == yearLists[index] + 543
                            ? Colors.white
                            : Constant.primaryColor,
                        fontSize: 16,
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
                        onPressed: () async {
                          setState(() {
                            isShowYearScreen = false;
                            widget.displayYearScreen(isShowYearScreen);
                            widget.sendDefaultNow(defaultNow);
                          });
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
                        child: TextButton(
                      onPressed: () async {
                        setState(() {
                          isShowYearScreen = false;
                          widget.displayYearScreen(isShowYearScreen);
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
