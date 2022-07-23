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
                  child: ElevatedButton(
                    onPressed: prin,
                    child: const Text('print'),
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Container(
                  color: Colors.green,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.zero,
                          color: Colors.blue,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.orange,
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              double ratio = (screenSize.width / 7) /
                                  (constraints.maxHeight);
                              debugPrint(ratio.toString());
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
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
                      // Date Sun Sat Fri THU WED TUE MON

                      Expanded(
                        flex: 8,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 11,
                              child: Row(
                                children: [
                                  const Expanded(
                                    child: SizedBox.shrink(),
                                  ),
                                  // Day 1, 2, 3, 4, 5, 6, 7, ...
                                  Expanded(
                                    flex: 19,
                                    child: GridView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      // padding: const EdgeInsets.only( left: 15, right: 15),
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 7,
                                        // mainAxisExtent: 1,
                                      ),
                                      itemCount: d.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Center(
                                          child: Text(
                                            d[index].toString(),
                                            style: const TextStyle(
                                              color: Colors.black87,
                                              fontSize: 14,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const Expanded(
                                    child: SizedBox.shrink(),
                                  ),
                                ],
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
