// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_project/calendar/constants/constant.dart';

class ChangeMonthSection extends StatefulWidget {
  final DateTime now;
  final Function(DateTime) getPreviousMonth;
  final Function(DateTime) getNextMonth;
  const ChangeMonthSection({
    Key? key,
    required this.now,
    required this.getPreviousMonth,
    required this.getNextMonth,
  }) : super(key: key);

  @override
  State<ChangeMonthSection> createState() => _ChangeMonthSectionState();
}

class _ChangeMonthSectionState extends State<ChangeMonthSection> {
  late DateTime previousMonth;
  late DateTime nextMonth;

  @override
  void initState() {
    super.initState();
    updateState();
  }

  updateState() {
    previousMonth = widget.now;
    nextMonth = widget.now;
  }

  double rotateDegree(double degree) {
    var angle = degree * pi / 180;
    return angle;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double padding = constraints.maxWidth * 0.02;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    previousMonth = DateTime(
                        widget.now.year, widget.now.month - 1, widget.now.day);
                    widget.getPreviousMonth(previousMonth);
                  });
                },
                icon: const Icon(Icons.arrow_back_ios_new),
                iconSize: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    getMonth(widget.now.month),
                    style: TextStyle(
                      color: Constant.primaryColor,
                      fontSize: 18,
                      height: 1.8,
                    ),
                  ),
                  SizedBox(
                    width: padding,
                  ),
                  Text(
                    '${(widget.now.year + 543)}',
                    style: TextStyle(
                      color: Constant.primaryColor,
                      fontSize: 18,
                      height: 2.8,
                    ),
                  ),
                  Transform.rotate(
                    angle: rotateDegree(0),
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: Constant.mainColor,
                      size: 38,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    nextMonth = DateTime(
                        widget.now.year, widget.now.month + 1, widget.now.day);
                    widget.getNextMonth(nextMonth);
                  });
                },
                icon: const Icon(Icons.arrow_forward_ios),
                iconSize: 18,
              ),
            ],
          ),
        );
      },
    );
  }
}
