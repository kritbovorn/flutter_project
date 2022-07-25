// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_project/calendar/widgets/calendar_header_widget.dart';

class CalendarHeaderSection extends StatelessWidget {
  final int date;
  const CalendarHeaderSection({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        // width: double.maxFinite,
        color: Colors.red,
        child: Column(
          children: [
            // *** Header
            Expanded(
              flex: 24,
              child: Container(
                width: double.maxFinite,
                color: Colors.red,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double pw = constraints.maxWidth * 0.08;
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: pw),
                      child: CalendarHeaderWidget(date: date),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
