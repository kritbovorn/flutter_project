import 'package:flutter/material.dart';
import 'package:flutter_project/calendar/sections/calendar_header_section.dart';
import 'package:flutter_project/calendar/sections/change_month_section.dart';
import 'package:flutter_project/calendar/sections/days_section.dart';
import 'package:flutter_project/calendar/sections/footer_section.dart';
import 'package:flutter_project/calendar/sections/week_section.dart';

const Color backgroundScreen = Color(0xFF6A6A6A);
const Color dateColor = Color(0xFF595959);
const Color cancelButtonColor = Colors.red;
const Color weekColor = Color(0xFF9A9A9A);
const Color dateSelectedColor = Colors.white;
const Color dateSelectedBackgroundColor = Colors.red;

// *! Method find last day
int daysInMonth(DateTime date) => DateTimeRange(
        start: DateTime(date.year, date.month, 1),
        end: DateTime(date.year, date.month + 1))
    .duration
    .inDays;

String getDay(int d) {
  String day = '';
  switch (d) {
    case 1:
      day = "จันทร์";
      break;
    case 2:
      day = "อังคาร";
      break;
    case 3:
      day = "พุธ";
      break;
    case 4:
      day = "พฤหัสบดี";
      break;
    case 5:
      day = "ศุกร์";
      break;
    case 6:
      day = "เสาร์";
      break;
    case 7:
      day = "อาทิตย์";
      break;
    default:
      break;
  }
  return day;
}

String getMonth(int month) {
  String m = '';
  switch (month) {
    case 1:
      m = "มกราคม";
      break;
    case 2:
      m = "กุมภาพันธ์";
      break;
    case 3:
      m = "มีนาคม";
      break;
    case 4:
      m = "เมษายน";
      break;
    case 5:
      m = "พฤษภาคม";
      break;
    case 6:
      m = "มิถุนายน";
      break;
    case 7:
      m = "กรกฎาคม";
      break;
    case 8:
      m = "สิงหาคม";
      break;
    case 9:
      m = "กันยายน";
      break;
    case 10:
      m = "ตุลาคม";
      break;
    case 11:
      m = "พฤศจิกายน";
      break;
    case 12:
      m = "ธันวาคม";
      break;
    default:
      break;
  }
  return m;
}

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime now = DateTime.now();
  late int lastDayCurrentMonth;
  late int date;
  // late String day;
  // late String month;
  // late int year;
  late List<int> d;
  late List<int> lastDayOfLastMonths;

  List<String> week = ['อา', 'จ', 'อ', 'พ', 'พฤ', 'ศ', 'ส'];

  @override
  void initState() {
    super.initState();
    updateState();
  }

  void updateState() {
    setState(() {
      // *! Initial value
      // *? วันสุดท้ายของเดือน
      lastDayCurrentMonth = daysInMonth(DateTime.now());
      // *?
      var lastDayOfLastMonth =
          DateTime.utc(DateTime.now().year, DateTime.now().month, 1).weekday;
      lastDayOfLastMonths = List.generate(lastDayOfLastMonth, (index) => index);
      // *? จำนวน วันทั้งหมดใน เดือน
      d = (lastDayOfLastMonths +
          List.generate(lastDayCurrentMonth, (index) => index + 1));
      // now = DateTime(now.year, now.month - 2312, 0);
    });
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
                child: SizedBox(
                  child: Column(
                    children: [
                      // ***** Month : March and Year
                      ChangeMonthSection(
                        now: now,
                        getPreviousMonth: (value) {
                          setState(() {
                            now = value;
                            debugPrint('162 : $now');
                          });
                        },
                        getAfterMonth: (value) {
                          setState(() {
                            now = value;
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
                              updateNow: (value) {
                                setState(() {
                                  now = value;
                                });
                              },
                            ),
                            // ***** Footer
                            const FooterSection(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
