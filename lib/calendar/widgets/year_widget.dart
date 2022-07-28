import 'package:flutter/material.dart';

class YearWidget extends StatefulWidget {
  const YearWidget({Key? key}) : super(key: key);

  @override
  State<YearWidget> createState() => _YearWidgetState();
}

class _YearWidgetState extends State<YearWidget> {
  late DateTime yearChoice;
  late List<int> yearLists;

  late int yearBuddhism;

  @override
  void initState() {
    yearChoice = DateTime.now();
    yearBuddhism = yearChoice.year + 543;
    yearLists = List.generate(50, (index) => yearBuddhism + index);
    // debugPrint(yearLists.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    // backgroundColor: const Color.fromARGB(255, 224, 221, 221),
    // body:
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'เลือกปี พุทธศักราจ',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              double h = constraints.maxHeight * 0.2;
              double ph = constraints.maxWidth * 0.05;
              debugPrint(h.toString());
              return Container(
                padding: EdgeInsets.symmetric(horizontal: ph),
                child: GridView.builder(
                  padding: const EdgeInsets.all(0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: ph * 0.8,
                    crossAxisSpacing: ph * 0.8,
                    mainAxisExtent: h,
                  ),
                  itemCount: yearLists.length,
                  itemBuilder: (BuildContext context, int index) {
                    String y = (yearBuddhism + index).toString();

                    return ElevatedButton(
                      onPressed: () {
                        debugPrint(y);
                      },
                      child: Text(yearLists[index].toString()),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
    // );
  }
}

// ทำปุ่ม Animation
// Show Year: GridView builder