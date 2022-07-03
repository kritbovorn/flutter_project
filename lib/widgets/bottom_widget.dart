import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/code_content_widget.dart';
import 'package:flutter_project/widgets/custom_bottom_bar_widget.dart';
import 'package:flutter_project/widgets/form_field_content_widget.dart';
import 'package:flutter_project/widgets/second_title_in_row.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: FormFieldContentWidget(),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: CodeContentWidget(),
        ),
        // BottomContentWidget(),
        CustomBottomBarWidget(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          padding: 28,
          child: SecondTitleInRow(
            firstTitle: "วันเสาร์",
            firstPressed: () {},
            secondTitle: "วันเสาร์",
            secondPressed: () {},
          ),
        ),
      ],
    );
  }
}
