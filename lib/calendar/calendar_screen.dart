import 'package:flutter/material.dart';
import 'package:flutter_project/calendar/sections/calendar_header_section.dart';
import 'package:flutter_project/calendar/sections/change_month_section.dart';
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

  int selectedDateIndex = 16;

  prin() {
    debugPrint(d.toString());
  }

  Color backgroundSelected(int index) {
    Color backgroundSelect = selectedDateIndex == d[index]
        ? dateSelectedBackgroundColor
        : Colors.transparent;
    return backgroundSelect;
  }

  Color colorSelected(int index) {
    Color colorSelect =
        selectedDateIndex == d[index] ? Colors.white : dateColor;
    return colorSelect;
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
            children: [
              const CalendarHeaderSection(),
              Expanded(
                flex: 9,
                child: SizedBox(
                  child: Column(
                    children: [
                      // *** Month : March and Year
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.zero,
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              double pw = constraints.maxWidth * 0.04;
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: pw),
                                child: const ChangeMonthSection(),
                              );
                            },
                          ),
                        ),
                      ),
                      // *** Week:  Sun Sat Fri THU WED TUE MON
                      Expanded(
                        child: WeekSection(date: date),
                      ),
                      // ***  Day
                      Expanded(
                        flex: 8,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 11,
                              child: SizedBox(
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    double ratio = (screenSize.width / 7) /
                                        (constraints.maxHeight / 5);
                                    double main = (constraints.maxHeight / 5);
                                    double pw = (constraints.maxWidth * 0.03);

                                    debugPrint(
                                        'Max height: ${constraints.maxHeight}');
                                    debugPrint(ratio.toString());
                                    return GridView.builder(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: pw),
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 7,
                                        crossAxisSpacing: 3,
                                        mainAxisExtent: main,
                                      ),
                                      itemCount: d.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return TextButton(
                                          onPressed: () {
                                            setState(() {
                                              selectedDateIndex = d[index];
                                              debugPrint(
                                                  selectedDateIndex.toString());
                                            });
                                          },
                                          style: TextButton.styleFrom(
                                            backgroundColor:
                                                backgroundSelected(index),
                                          ),
                                          child: Text(
                                            d[index].toString(),
                                            style: TextStyle(
                                              color: colorSelected(index),
                                              fontSize: 14,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            // *** Footer
                            const FooterSection(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
