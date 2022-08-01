// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_project/calendar/main_screen/calendar_screen.dart';
import 'package:flutter_project/calendar/main_screen/year_screen.dart';
import 'package:flutter_project/calendar/sections/calendar_header_section.dart';
import 'package:flutter_project/calendar/sections/change_month_section.dart';

class Calendar extends StatefulWidget {
  final DateTime receiveNow;
  const Calendar({
    Key? key,
    required this.receiveNow,
  }) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late final DateTime currentDateTime;
  late DateTime now;
  // late DateTime newNow;

  late int year;
  late int month;
  late int day;
  late DateTime thisMonth;
  late DateTime lastMonth;
  late DateTime previousMonth;
  late DateTime nextMonth;
  late int lastDayOfLastMonth;
  late int lastDayOfMonth;
  late int lastDateOfLastMonthInWeek;

  late List<int> allDaysInMonth;
  late List<int> daysOfLastMonthInWeek;
  late List<int> allDays;

  bool isShowYearScreen = false;

  @override
  void initState() {
    super.initState();
    currentDateTime =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    // now = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    now = widget.receiveNow;
    updateState(now);
  }

  void updateState(DateTime now) {
    setState(() {
      debugPrint(
          'Calendar : Line #45 :: --------------: CurrentDateTime: $currentDateTime');
      debugPrint('Calendar : Line #46 ::: Now : $now');
      // *!  now   เป็นตัวแปร หลัก

      // newNow = DateTime(dateTime.year, dateTime.month, dateTime.day);
      year = now.year;
      month = now.month;
      day = now.day;

      thisMonth = DateTime(year, month, 1);
      lastMonth = DateTime(year, month, 0);

      previousMonth = DateTime(year, month - 1, 0);
      nextMonth = DateTime(year, month + 1, 0);

      // *?  วันสุดท้าย ของเดือนนี้
      lastDayOfMonth = nextMonth.day;
      debugPrint(
          'Calendar : Line #57 :: วันสุดท้าย ของเดือนนี้ : $lastDayOfMonth');

      // *?  วันสุดท้าย ของเดือนก่อน
      lastDayOfLastMonth = lastMonth.day; /////
      debugPrint(
          'Calendar : Line #62 :: วันสุดท้าย ของเดือนก่อน : $lastDayOfLastMonth');

      // *? ************* ลำดับต่อไป ที่จะให้วันที่ 1 พิมพ์ออกมา
      lastDateOfLastMonthInWeek = thisMonth.weekday;
      debugPrint(
          'Calendar : Line #67 ::: ลำดับ ที่จะเริ่ม แสดงผล ในตาราง $lastDateOfLastMonthInWeek');

      // *? จำนวนวันทั้งหมด ในเดือน
      allDaysInMonth = List.generate(lastDayOfMonth, (index) => index + 1);
      debugPrint(
          'Calendar : Line #72 ::: จำนวนวันทั้งหมด ในเดือน $allDaysInMonth');

      // *? จำนวน วันสุดท้ายทั้งหมด ของเดือนที่แล้ว  List
      daysOfLastMonthInWeek =
          List.generate(lastDateOfLastMonthInWeek, (index) => 0);
      debugPrint(
          'Calendar : Line #78 ::: จำนวน วันสุดท้ายทั้งหมด ของเดือนที่แล้ว ในสัปดาห์ $daysOfLastMonthInWeek');

      // *? รวม จำนวน ทั้งหมด เพื่อที่ จะ พิมพ์ออกที่  UI
      allDays = allDaysInMonth + daysOfLastMonthInWeek;
      // allDay();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 109, 109, 109),
      body: Center(
        child: Container(
          color: Colors.white,
          width: screenSize.width * 0.9,
          height: screenSize.height * 0.7,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  Expanded(
                    flex: 5,
                    // *!       Header Section
                    child: CalendarHeaderSection(
                      now: now,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    // *!       Change Month Section
                    child: ChangeMonthSection(
                      now: now,
                      getPreviousMonth: (value) {
                        setState(() {
                          now = value;
                          updateState(now);
                        });
                      },
                      getNextMonth: (value) {
                        setState(() {
                          now = value;
                          updateState(now);
                        });
                      },
                      displayYearScreen: (value) {
                        setState(() {
                          isShowYearScreen = value;
                        });
                      },
                    ),
                  ),
                  isShowYearScreen
                      ? const Expanded(
                          flex: 19,
                          child: YearScreen(),
                        )
                      : Expanded(
                          flex: 19,
                          // *!       Main Calendar    1, 2, 3, 4, 5 , 6........
                          child: CalendarScreen(
                            currentDateTime: currentDateTime,
                            now: now,
                            allDaysInMonth: allDaysInMonth,
                            allDays: allDays,
                            lastDateOfLastMonthInWeek:
                                lastDateOfLastMonthInWeek,
                            getNewNow: (value) {
                              setState(() {
                                now = value;
                              });
                            },
                          ),
                          // child: Container(),
                        ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
