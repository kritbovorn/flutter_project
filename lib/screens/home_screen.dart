import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DateTime now;
  late int thisMonth;
  late int beforeMonth;
  late int afterMonth;
  late int day;
  late DateTime lastDayOfCurrentMonthTime;
  late DateTime nextMonth;
  late int lastDayOfCurrentMonth;

  @override
  void initState() {
    super.initState();
    initialState();
  }

  initialState() {
    now = DateTime.now();
    // *? day
    day = now.day;
    // *? เดือนนี้
    thisMonth = now.month;
    beforeMonth = now.month - 1;
    afterMonth = now.month + 1;
    //*?
    lastDayOfCurrentMonthTime = DateTime(now.year, now.month + 1, 0);
    lastDayOfCurrentMonth = lastDayOfCurrentMonthTime.day;
    // *?
    nextMonth = DateTime(now.year, now.month + 1, 1);

    // *?
     debugPrint('${now.weekday}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'วันปัจจุบัน : ${now.toString()}',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'วัน : ${day.toString()}',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'เดือนนี้ คือ : $thisMonth',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'เดือนก่อน คือ : $beforeMonth',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'เดือนหน้า คือ : $afterMonth',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'วันสุดท้าย ของเดือนนี้ คือ : $lastDayOfCurrentMonth',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              '$nextMonth',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'Somethings',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
