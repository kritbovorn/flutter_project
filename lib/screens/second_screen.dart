import 'package:flutter/material.dart';
import 'package:flutter_project/screens/third_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Page 2',
              style: Theme.of(context).textTheme.headline4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: ElevatedButton(
                child: const Text('Pop back to : Page 1'),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            ElevatedButton(
              child: const Text('Push to: Page 3'),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ThirdScreen())),
            )
          ],
        ),
      ),
    );
  }
}
