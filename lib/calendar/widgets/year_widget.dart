import 'package:flutter/material.dart';

class YearWidget extends StatefulWidget {
  const YearWidget({Key? key}) : super(key: key);

  @override
  State<YearWidget> createState() => _YearWidgetState();
}

class _YearWidgetState extends State<YearWidget> {
  late DateTime yearChoice;
  late List<int> yearLists;

  @override
  void initState() {
    yearChoice = DateTime.now();
    yearLists = List.generate(50, (index) => yearChoice.year + index);
    debugPrint(yearLists.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 221, 221),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Center',
              style: Theme.of(context).textTheme.headline3,
            ),
            Expanded(
              child: Container(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                  ),
                  itemCount: yearLists.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ElevatedButton(
                      onPressed: () {},
                      child: Text(yearLists[index].toString()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ทำปุ่ม Animation
// Show Year: GridView builder