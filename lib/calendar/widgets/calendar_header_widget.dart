// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_project/calendar/calendar_screen.dart';

import 'package:flutter_project/calendar/widgets/text_widget.dart';

class CalendarHeaderWidget extends StatelessWidget {
  final DateTime now;
  const CalendarHeaderWidget({
    Key? key,
    required this.now,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          flex: 3,
          child: SizedBox.shrink(),
        ),
        Expanded(
          flex: 3,
          child: TextWidget(
            title: (now.year + 543).toString(),
          ),
        ),
        Expanded(
          flex: 6,
          child: TextWidget(
            title: '${getDay(now.weekday)}, ${getMonth(now.month)} ${now.day}',
          ),
        ),
        const Expanded(
          flex: 3,
          child: SizedBox.shrink(),
        ),
      ],
    );
  }
}
