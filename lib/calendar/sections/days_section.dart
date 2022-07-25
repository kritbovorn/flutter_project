// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_project/calendar/calendar_screen.dart';

class DaysSection extends StatefulWidget {
  final List<int> d;
  final int date;
  final Function(int) getdate;
  const DaysSection({
    Key? key,
    required this.d,
    required this.date,
    required this.getdate,
  }) : super(key: key);

  @override
  State<DaysSection> createState() => _DaysSectionState();
}

class _DaysSectionState extends State<DaysSection> {
  late int selectedDateIndex;

  @override
  void initState() {
    super.initState();
    selectedDateIndex = widget.date;
  }

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
                    widget.getdate(selectedDateIndex);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: backgroundSelected(i),
                    shape: const CircleBorder(),
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
