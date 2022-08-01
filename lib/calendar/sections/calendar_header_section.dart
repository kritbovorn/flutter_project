import 'package:flutter/material.dart';
import 'package:flutter_project/calendar/widget/calendar_header_widget.dart';


class CalendarHeaderSection extends StatelessWidget {
  final DateTime now;
  const CalendarHeaderSection({
    Key? key,
    required this.now,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    child: CalendarHeaderWidget(
                      now: now,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
