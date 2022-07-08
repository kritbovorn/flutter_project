import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 1. ประกาศตัวแปร Future มารับค่า
  late Future<int?> dataFuture;

  @override
  void initState() {
    super.initState();
    // 3. กำหนดให้มีค่าเท่ากับ ข้อมูลใน Future function
    dataFuture = getData();
  }

  // 2. สร้าง Function FutureBuilder()
  Future<int?> getData() async {
    try {
      http.Response response = await http.get(
        Uri.parse('https://randomnumberapi.com/api/v1.0/random'),
      );
      final data = jsonDecode(response.body);
      int randomNumber = (data as List).first;
      return randomNumber;
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // 4. เรียกใช้
        child: FutureBuilder<int?>(
          future: dataFuture, // 5. เอาตัวแปร ที่ initState() มาใช้
          initialData: 0, //  6. กำหนดค่าเริ่มต้น
          builder: (context, snapshot) {

            //  $$$$$ : Switch STATEMENT
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                 return Text(
                    '⏳ ${snapshot.data}',
                    style: Theme.of(context).textTheme.headline5,
                  );
              case ConnectionState.done:
              default:
                if (snapshot.hasError) {
                  final error = snapshot.error;
                  return Text(
                    '😵‍💫 $error',
                    style: Theme.of(context).textTheme.headline5,
                  );
                } else if (snapshot.hasData) {
                  int data = snapshot.data!;
                  return Text(
                    '🏈 $data',
                    style: Theme.of(context).textTheme.headline5,
                  );
                } else {
                  return const CircularProgressIndicator();
                }
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () => setState(() => {
              SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                dataFuture = getData();
              })
            }),
      ),
    );
  }
}
