import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/bottom_content_widget.dart';
import 'package:flutter_project/widgets/code_content_widget.dart';
import 'package:flutter_project/widgets/form_field_content_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg.png'), fit: BoxFit.fitHeight),
        ),
        child: SafeArea(
          bottom: false,
          child: SizedBox(
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: SizedBox(
                    child: Image.asset('assets/ico-true-plus.png'),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: const [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 28),
                          child: FormFieldContentWidget(),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 28, vertical: 2),
                        child: CodeContentWidget(),
                      ),
                      BottomContentWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
