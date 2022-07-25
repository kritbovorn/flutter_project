// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_project/calendar/widgets/text_widget.dart';

class CalendarHeaderWidget extends StatelessWidget {
  final int date;
  final String day;
  final String month;
  final int year;
  const CalendarHeaderWidget({
    Key? key,
    required this.date,
    required this.day,
    required this.month,
    required this.year,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            flex: 3,
            child: SizedBox.shrink(),
          ),
          Expanded(
            flex: 3,
            child: TextWidget(
              title: '$year',
            ),
          ),
          Expanded(
            flex: 6,
            child: TextWidget(
              title: '$day, $month $date',
            ),
          ),
          const Expanded(
            flex: 3,
            child: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
