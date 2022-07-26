// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_project/calendar/widgets/text_widget.dart';

class CalendarHeaderWidget extends StatelessWidget {
  final DateTime now;
  const CalendarHeaderWidget({
    Key? key,
    required this.now,
  }) : super(key: key);

  String getDay(int d) {
    String day = '';
    switch (d) {
      case 1:
        day = "จันทร์";
        break;
      case 2:
        day = "อังคาร";
        break;
      case 3:
        day = "พุทธ";
        break;
      case 4:
        day = "พฤหัสบดี";
        break;
      case 5:
        day = "ศุกร์";
        break;
      case 6:
        day = "เสาร์";
        break;
      case 7:
        day = "อาทิตย์";
        break;
      default:
        break;
    }
    return day;
  }

  String getMonth(int month) {
    String m = '';
    switch (month) {
      case 1:
        m = "มกราคม";
        break;
      case 2:
        m = "กุมภาพันธ์ู";
        break;
      case 7:
        m = "กรกฎาคม";
        break;
      case 8:
        m = "สิงหาคม";
        break;
      default:
        break;
    }
    return m;
  }

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
            title: '${now.year}',
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
