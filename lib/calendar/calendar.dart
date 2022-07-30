import 'package:flutter/material.dart';
import 'package:flutter_project/calendar/main_screen/main_screen.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Center(
      child: Container(
        color: Colors.white,
        width: screenSize.width * 0.9,
        height: screenSize.height * 0.7,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: const Color.fromARGB(255, 13, 148, 17),
                  ),
                ),
                const Expanded(
                  flex: 19,
                  child: MainScreen(),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
