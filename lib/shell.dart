import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/side_menu.dart';

class Shell extends StatelessWidget {
  const Shell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: const [
                SideMenu(),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 84,
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
