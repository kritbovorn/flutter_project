import 'package:flutter/material.dart';
import 'package:flutter_project/calendar/models/models.dart';
import 'package:flutter_project/calendar/sections/calendar_header_section.dart';
import 'package:flutter_project/calendar/sections/change_month_section.dart';
import 'package:flutter_project/calendar/sections/days_section.dart';
import 'package:flutter_project/calendar/sections/footer_section.dart';
import 'package:flutter_project/calendar/sections/week_section.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime now = DateTime.now();
  late int lastDayCurrentMonth;
  late int date;
  late List<int> d;
  late List<int> lastDayOfLastMonths;

  List<String> week = ['อา', 'จ', 'อ', 'พ', 'พฤ', 'ศ', 'ส'];

  bool isShowDialogYear = false;

  @override
  void initState() {
    super.initState();
    updateState();
  }

  void updateState() {
    setState(() {
      // *? วันสุดท้ายของเดือน
      lastDayCurrentMonth = daysInMonth(DateTime.now());
      debugPrint('127 $lastDayCurrentMonth');

      var lastDayOfLastMonth =
          DateTime.utc(DateTime.now().year, DateTime.now().month, 1).weekday;
      lastDayOfLastMonths = List.generate(lastDayOfLastMonth, (index) => index);

      // *? จำนวน วันทั้งหมดใน เดือน
      d = (lastDayOfLastMonths +
          List.generate(lastDayCurrentMonth, (index) => index + 1));
    });
  }

  void updateAllDays(DateTime now) {
    lastDayCurrentMonth = daysInMonth(now);
    var lastDayOfLastMonth = DateTime.utc(now.year, now.month, 1).weekday;
    lastDayOfLastMonths = List.generate(lastDayOfLastMonth, (index) => index);

    d = (lastDayOfLastMonths +
        List.generate(lastDayCurrentMonth, (index) => index));
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundScreen,
      body: Center(
        child: Container(
          color: Colors.white,
          width: screenSize.width * 0.9,
          height: screenSize.height * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CalendarHeaderSection(
                now: now,
              ),
              Expanded(
                flex: 9,
                child: Column(
                  children: [
                    // ***** Month : March and Year
                    ChangeMonthSection(
                      now: now,
                      getPreviousMonth: (value) {
                        setState(() {
                          now = value;
                          debugPrint('162 : $now');
                          updateAllDays(now);
                        });
                      },
                      getAfterMonth: (value) {
                        setState(() {
                          now = value;
                          updateAllDays(now);
                        });
                      },
                      isOpenYear: (isOpen) {
                        setState(() {
                          isShowDialogYear = isOpen;
                          debugPrint('97777 $isShowDialogYear');
                        });
                      },
                    ),
                    // ***** Week:  Sun Sat Fri THU WED TUE MON
                    Expanded(
                      child: WeekSection(date: week),
                    ),
                    // ***** Day: 1, 2, 3, 4, ...
                    Expanded(
                      flex: 8,
                      child: Column(
                        children: [
                          DaysSection(
                            d: d,
                            now: now,
                            dayOfLastMonth: lastDayOfLastMonths.length,
                            lastDayCurrentMonth: lastDayCurrentMonth,
                            updateNow: (value) {
                              setState(() {
                                now = value;
                              });
                            },
                          ),
                          // ***** Footer
                        ],
                      ),
                    ),
                    const Expanded(
                      flex: 2,
                      child: FooterSection(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
