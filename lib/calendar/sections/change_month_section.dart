import 'package:flutter/material.dart';
import 'package:flutter_project/calendar/constants/constant.dart';

class ChangeMonthSection extends StatefulWidget {
  const ChangeMonthSection({Key? key}) : super(key: key);

  @override
  State<ChangeMonthSection> createState() => _ChangeMonthSectionState();
}

class _ChangeMonthSectionState extends State<ChangeMonthSection> {
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
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios_new),
                iconSize: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'มกราคม',
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
                    '2565',
                    style: TextStyle(
                      color: Constant.primaryColor,
                      fontSize: 18,
                      height: 2.8,
                    ),
                  )
                ],
              ),
              IconButton(
                onPressed: () {},
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
