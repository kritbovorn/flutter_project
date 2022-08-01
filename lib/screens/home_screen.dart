import 'package:flutter/material.dart';
import 'package:flutter_project/calendar/constants/constant.dart';
import 'package:flutter_project/screens/display_calendar_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DateTime now;

  @override
  void initState() {
    super.initState();
    now = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 109, 109, 109),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ' วัน${getDay(now.weekday)} ที่ ${now.day} ${getMonth(now.month)} พ.ศ. ${now.year + 543} ',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              height: 34,
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DisplayCalendarScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 10,
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
              ),
              child: Text(
                'เลือกวัน เดือน ปี',
                style: Theme.of(context).textTheme.headline5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
