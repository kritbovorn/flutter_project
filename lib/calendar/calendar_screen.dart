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
  List<int> d = List.generate(31, (index) => index + 1);
  List<String> date = ['อา', 'จ', 'อ', 'พ', 'พฤ', 'ศ', 'ส'];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundScreen,
      body: Center(
        child: Container(
          color: Colors.white,
          width: screenSize.width * 0.9,
          height: screenSize.height * 0.7,
          child: Column(
            children: [
              const CalendarHeaderSection(),
              Expanded(
                flex: 9,
                child: SizedBox(
                  child: Column(
                    children: [
                      // ***** Month : March and Year
                      const ChangeMonthSection(),
                      // ***** Week:  Sun Sat Fri THU WED TUE MON
                      Expanded(
                        child: WeekSection(date: date),
                      ),
                      // ***** Day: 1, 2, 3, 4, ...
                      Expanded(
                        flex: 8,
                        child: Column(
                          children: [
                            DaysSection(d: d),
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
