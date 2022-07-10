import 'package:flutter/material.dart';
import 'package:flutter_project/screens/pop_result_screen.dart';
import 'package:flutter_project/screens/second_screen.dart';
import 'package:flutter_project/screens/will_pop_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isDataBack = false;
  bool isShowButton = false;

  showSnack(String message) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Novigator 1.0'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 50,
              color: isDataBack ? Colors.blue : Colors.red,
            ),
            Text(
              "Page 1",
              style: Theme.of(context).textTheme.headline4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: ElevatedButton(
                child: const Text('Push to : Page 2'),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecondScreen())),
              ),
            ),
            ElevatedButton(
              child: const Text('Replace: Page 2'),
              onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SecondScreen())),
            ),
            const Divider(height: 48),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: ElevatedButton(
                child: const Text('เปลี่ยนสี Container()'),
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PopResultScreen(
                        data: 'เปลี่ยนสี Container()',
                        hasChange: isDataBack,
                        isShowButton: false,
                      ),
                    ),
                  );

                  setState(() {
                    isDataBack = result;
                  });

                  showSnack('Data back is: $result');
                },
              ),
            ),
            ElevatedButton(
              child: const Text('Get Data from TextField'),
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PopResultScreen(
                      data: 'Get data from Field',
                      hasChange: isDataBack,
                      isShowButton: true,
                    ),
                  ),
                );
                showSnack(result);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: ElevatedButton(
                  child: const Text('Is Allowed'),
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WillPopScreen(
                              data: "Is Allowed to Pop Back"),
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
