// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_project/calendar/calendar_screen.dart';
import 'package:flutter_project/calendar/components/calendar_text.dart';

class ChangeMonthSection extends StatefulWidget {
  final DateTime now;
  final Function(DateTime) getPreviousMonth;
  final Function(DateTime) getAfterMonth;
  const ChangeMonthSection({
    Key? key,
    required this.now,
    required this.getPreviousMonth,
    required this.getAfterMonth,
  }) : super(key: key);

  @override
  State<ChangeMonthSection> createState() => _ChangeMonthSectionState();
}

class _ChangeMonthSectionState extends State<ChangeMonthSection> {
  @override
  Widget build(BuildContext context) {
    DateTime previousMonth = widget.now;
    DateTime afterMonth = widget.now;
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
                    onPressed: () {
                      setState(() {
                        previousMonth =
                            DateTime(widget.now.year, widget.now.month - 1, 1);

                        widget.getPreviousMonth(previousMonth);
                      });
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                    iconSize: 17,
                  ),
                  Row(
                    children: [
                      CalendarText(
                        title: getMonth(widget.now.month),
                        fontColor: Colors.black,
                        fontSize: 17,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      CalendarText(
                        title: (widget.now.year + 543).toString(),
                        fontColor: Colors.black,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        afterMonth =
                            DateTime(widget.now.year, widget.now.month + 1, 1);
                        widget.getAfterMonth(afterMonth);
                      });
                      debugPrint('Previous');
                    },
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
