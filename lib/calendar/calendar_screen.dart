import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  List<int> d = List.generate(31, (index) => index + 1);
  List<String> date = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

  prin() {
    debugPrint(d.toString());
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.red,
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
                      Expanded(
                        flex: 24,
                        child: Container(
                          color: Colors.indigo,
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              double pw = constraints.maxWidth * 0.08;
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: pw),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
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
                                                  // height: 0,
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
                child: Container(
                  color: Colors.green,
                  child: Column(
                    children: [
                      // *** March and Year
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.zero,
                          color: Colors.blue,
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
                                      iconSize: 14,
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
                                            fontSize: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      iconSize: 14,
                                      icon: const Icon(Icons.arrow_forward_ios),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      // *** Date Sun Sat Fri THU WED TUE MON
                      Expanded(
                        child: Container(
                          color: Colors.orange,
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              double ratio = (screenSize.width / 7) /
                                  (constraints.maxHeight);
                              double pw = constraints.maxWidth * 0.03;
                              // debugPrint(ratio.toString());
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                      return Center(child: Text(date[index]));
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),

                      Expanded(
                        flex: 8,
                        child: Column(
                          children: [
                            // ***  Day
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
                                          onPressed: () {},
                                          child: Text(
                                            d[index].toString(),
                                            style: const TextStyle(
                                              color: Colors.black,
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
                            Expanded(
                              flex: 6,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 10,
                                    child: Container(
                                      color: Colors.pink,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 15,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            color: Colors.yellow,
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: TextButton(
                                                  child: const Text(
                                                    'CANCEL',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: TextButton(
                                                  child: const Text(
                                                    'OK',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
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
