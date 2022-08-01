import 'package:flutter/material.dart';

class YearScreen extends StatefulWidget {
  const YearScreen({Key? key}) : super(key: key);

  @override
  State<YearScreen> createState() => _YearScreenState();
}

class _YearScreenState extends State<YearScreen> {
  // late DateTimeRange yearRange;
  late List<int> beforeYears;
  late List<int> afterYears;
  late List<int> yearLists;

  @override
  void initState() {
    super.initState();

    beforeYears = List.generate(15, (index) => DateTime.now().year - index)
        .reversed
        .toList();
    afterYears = List.generate(15, (index) => DateTime.now().year + index)
      ..removeAt(0);
    yearLists = beforeYears + afterYears;
    debugPrint('YearScreen : Line #26 ::: $yearLists');
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double heigh = constraints.maxWidth * 0.15;
        return GridView.builder(
          // padding: EdgeInsets.zero,
          padding:
              EdgeInsets.symmetric(horizontal: heigh / 2, vertical: heigh / 2),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: heigh / 2,
            mainAxisSpacing: heigh / 2,
            mainAxisExtent: heigh,
          ),
          itemCount: yearLists.length,
          itemBuilder: (BuildContext context, int index) {
            return ElevatedButton(
              onPressed: () {},
              child: Text(yearLists[index].toString()),
            );
          },
        );
      },
    );
  }
}
