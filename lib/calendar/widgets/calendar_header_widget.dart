import 'package:flutter/material.dart';
import 'package:flutter_project/calendar/components/calendar_text.dart';

class CalendarHeaderWidget extends StatelessWidget {
const CalendarHeaderWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        const Expanded(
          child: SizedBox.shrink(),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CalendarText(
                title: '2565',
                fontSize: 17,
                textHeight: 0.2, // *** Layout
              ),
              Row(
                children: const [
                  CalendarText(
                    title: 'อาทิตย์, ',
                    textHeight: 1.6, // *** Layout
                  ),
                  CalendarText(
                    title: 'มีนาคม\t',
                  ),
                  CalendarText(
                    title: '16',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}