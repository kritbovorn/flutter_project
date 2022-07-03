import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/bottom_content_widget.dart';
import 'package:flutter_project/widgets/code_content_widget.dart';
import 'package:flutter_project/widgets/form_field_content_widget.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: FormFieldContentWidget(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: CodeContentWidget(),
        ),
        BottomContentWidget(),
      ],
    );
  }
}
