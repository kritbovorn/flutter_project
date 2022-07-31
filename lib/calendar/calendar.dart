import 'package:flutter/material.dart';
import 'package:flutter_project/calendar/main_screen/main_screen.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late final DateTime currentDateTime;
  late DateTime now;
  late DateTime newNow;

  late int year;
  late int month;
  late int day;
  late DateTime thisMonth;
  late DateTime previousMonth;
  late DateTime nextMonth;
  late int lastDayOfLastMonth;
  late int lastDayOfMonth;
  late int lastDateOfLastMonthInWeek;

  late List<int> allDaysInMonth;
  late List<int> daysOfLastMonthInWeek;
  late List<int> allDays;

  @override
  void initState() {
    super.initState();
    updateState();
  }

  void updateState() {
    setState(() {
      currentDateTime = DateTime.now();
      now = DateTime.now();
      newNow = DateTime.now();
      year = now.year;
      month = now.month;
      day = now.day;

      thisMonth = DateTime(year, month, 0);

      previousMonth = DateTime(year, month - 1, 0);
      nextMonth = DateTime(year, month + 1, 0);

      // *?  วันสุดท้าย ของเดือนนี้
      lastDayOfMonth = nextMonth.day;
      debugPrint(
          'Calendar : Line #53 :: วันสุดท้าย ของเดือนนี้ : $lastDayOfMonth');

      // *?  วันสุดท้าย ของเดือนก่อน
      lastDayOfLastMonth = thisMonth.day;
      debugPrint(
          'Calendar : Line #58 :: วันสุดท้าย ของเดือนก่อน : $lastDayOfLastMonth');

      // *? ************* ลำดับต่อไป ที่จะให้วันที่ 1 พิมพ์ออกมา  (  บวก 1. เพราะ  มีวันอาทิตย์ มา เริ่มก่อน  1 ตำแหน่ง)
      lastDateOfLastMonthInWeek = thisMonth.weekday + 1;
      debugPrint(
          'Calendar : Line #63 ::: ลำดับ ที่จะเริ่ม แสดงผล ในตาราง $lastDateOfLastMonthInWeek');

      // *? จำนวนวันทั้งหมด ในเดือน
      allDaysInMonth = List.generate(lastDayOfMonth, (index) => index + 1);
      debugPrint(
          'Calendar : Line #68 ::: จำนวนวันทั้งหมด ในเดือน $allDaysInMonth');

      // *? จำนวน วันสุดท้ายทั้งหมด ของเดือนที่แล้ว  List
      daysOfLastMonthInWeek =
          List.generate(lastDateOfLastMonthInWeek, (index) => 0);
      debugPrint(
          'Calendar : Line #74 ::: จำนวน วันสุดท้ายทั้งหมด ของเดือนที่แล้ว $daysOfLastMonthInWeek');

      // *? รวม จำนวน ทั้งหมด เพื่อที่ จะ พิมพ์ออกที่  UI
      allDays = allDaysInMonth + daysOfLastMonthInWeek;
      // allDay();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Center(
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
                  child: Container(
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: const Color.fromARGB(255, 13, 148, 17),
                  ),
                ),
                Expanded(
                  flex: 19,
                  child: MainScreen(
                    now: now,
                    allDaysInMonth: allDaysInMonth,
                    allDays: allDays,
                    lastDateOfLastMonthInWeek: lastDateOfLastMonthInWeek,
                  ),
                  // child: Container(),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
