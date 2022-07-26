// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_project/calendar/calendar_screen.dart';

import 'package:flutter_project/calendar/components/calendar_text.dart';

class ChangeMonthSection extends StatelessWidget {
  final DateTime now;
  const ChangeMonthSection({
    Key? key,
    required this.now,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.zero,
        child: LayoutBuilder(
          builder: (context, constraints) {
            double pw = constraints.maxWidth * 0.04;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: pw),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_ios),
                    iconSize: 17,
                  ),
                  Row(
                    children: [
                      CalendarText(
                        // title: 'มีนาคม',
                        title: getMonth(now.month),
                        fontColor: Colors.black,
                        fontSize: 17,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      CalendarText(
                        title: (now.year + 543).toString(),
                        fontColor: Colors.black,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    iconSize: 17,
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
