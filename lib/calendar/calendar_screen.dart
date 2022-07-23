import 'package:flutter/material.dart';
import 'package:flutter_project/calendar/widgets/action_widget.dart';

const Color backgroundScreen = Color(0xFF6A6A6A);
const Color dateColor = Color(0xFF595959);
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
  List<String> date = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

  int selectedDateIndex = 1;

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
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.red,
                  child: Column(
                    children: [
                      // *** Header
                      Expanded(
                        flex: 24,
                        child: Container(
                          color: Colors.red,
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              double pw = constraints.maxWidth * 0.08;
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: pw),
                                child: Column(
                                  children: [
                                    const Expanded(
                                      child: SizedBox.shrink(),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            '2565',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              height: 0.5,
                                            ),
                                          ),
                                          Row(
                                            children: const [
                                              Text(
                                                'Mon,\t',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 34,
                                                ),
                                              ),
                                              Text(
                                                'Mar\t',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 34,
                                                ),
                                              ),
                                              Text(
                                                '16',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 34,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.arrow_back_ios),
                                      iconSize: 17,
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          'March',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '2565',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      iconSize: 17,
                                      icon: const Icon(Icons.arrow_forward_ios),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      // *** Week:  Sun Sat Fri THU WED TUE MON
                      Expanded(
                        child: SizedBox(
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              double ratio = (screenSize.width / 7) /
                                  (constraints.maxHeight);
                              double pw = constraints.maxWidth * 0.03;
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: pw),
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 7,
                                      childAspectRatio: ratio,
                                    ),
                                    itemCount: date.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Center(
                                        child: Text(
                                          date[index],
                                          style: const TextStyle(
                                            color: weekColor,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
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
                            Expanded(
                              flex: 6,
                              child: Column(
                                children: [
                                  const Expanded(
                                    flex: 10,
                                    child: SizedBox.shrink(),
                                  ),
                                  Expanded(
                                    flex: 15,
                                    child: Row(
                                      children: const [
                                        Expanded(
                                          child: SizedBox.shrink(),
                                        ),
                                        ActionWidget(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
