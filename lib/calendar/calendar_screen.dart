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

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime now = DateTime.now();
  late int lastDayOfMonth;
  late int date;
  late String day;
  late String month;
  late int year;
  late List<int> d;

  List<String> week = ['อา', 'จ', 'อ', 'พ', 'พฤ', 'ศ', 'ส'];

  @override
  void initState() {
    super.initState();
    // *! Initial value
    // *? วันสุดท้ายของเดือน
    lastDayOfMonth = daysInMonth(DateTime.now());
    // *? จำนวน วันทั้งหมดใน เดือน
    d = List.generate(lastDayOfMonth, (index) => index + 1);
    // *? วันปัจจุบัน
    date = now.day;
    // *? วันในสัปดาห์
    day = getDay(now.weekday);
    // *? เดือน
    month = getMonth(now.month);
    // *? ปี
    year = now.year + 543;
  }

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
        day = "พุทธ";
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
        m = "กุมภาพันธ์ู";
        break;
      case 7:
        m = "กรกฎาคม";
        break;
      case 8:
        m = "สิงหาคม";
        break;
      default:
        break;
    }
    return m;
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
                date: date,
                day: day,
                month: month,
                year: year,
              ),
              Expanded(
                flex: 9,
                child: SizedBox(
                  child: Column(
                    children: [
                      // ***** Month : March and Year
                      const ChangeMonthSection(),
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
                                date: date,
                                getdate: (value) =>
                                    setState(() => date = value)),
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
