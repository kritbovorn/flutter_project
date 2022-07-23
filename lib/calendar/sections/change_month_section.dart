import 'package:flutter/material.dart';
import 'package:flutter_project/calendar/components/calendar_text.dart';

class ChangeMonthSection extends StatelessWidget {
  const ChangeMonthSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 17,
        ),
        Row(
          children: const [
            CalendarText(
              title: 'มีนาคม',
              fontColor: Colors.black,
              fontSize: 17,
            ),
            SizedBox(
              width: 5,
            ),
            CalendarText(
              title: '2565',
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
    );
  }
}
