// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_project/calendar/calendar_screen.dart';

class WeekSection extends StatelessWidget {
  final List<String> date;
  const WeekSection({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      child: LayoutBuilder(
        builder: (context, constraints) {
          double ratio = (screenSize.width / 7) / (constraints.maxHeight);
          double pw = constraints.maxWidth * 0.03;
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: pw),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  childAspectRatio: ratio,
                ),
                itemCount: date.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Text(
                      date[index],
                      style: const TextStyle(
                        color: weekColor,
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
