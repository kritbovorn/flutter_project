// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_project/calendar/calendar_screen.dart';

class DaysSection extends StatefulWidget {
  final List<int> d;
  const DaysSection({
    Key? key,
    required this.d,
  }) : super(key: key);

  @override
  State<DaysSection> createState() => _DaysSectionState();
}

class _DaysSectionState extends State<DaysSection> {
  int selectedDateIndex = 16;

  Color backgroundSelected(int index) {
    Color backgroundSelect = selectedDateIndex == index
        ? dateSelectedBackgroundColor
        : Colors.transparent;
    return backgroundSelect;
  }

  Color colorSelected(int index) {
    Color colorSelect = selectedDateIndex == index ? Colors.white : dateColor;
    return colorSelect;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 11,
      child: SizedBox(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double main = (constraints.maxHeight / 5);
            double pw = (constraints.maxWidth * 0.03);
            return GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: pw),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                crossAxisSpacing: 3,
                mainAxisExtent: main,
              ),
              itemCount: widget.d.length,
              itemBuilder: (BuildContext context, int index) {
                var i = index + 1;
                return TextButton(
                  onPressed: () {
                    setState(() {
                      selectedDateIndex = i;
                      // debugPrint(selectedDateIndex.toString());
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: backgroundSelected(i),
                  ),
                  child: Text(
                    i.toString(),
                    style: TextStyle(
                      color: colorSelected(i),
                      fontSize: 14,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
