// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_project/calendar/widgets/action_widget.dart';

class FooterSection extends StatelessWidget {
  final int? mainExpandFlex;
  final int? firstChildFlex;
  final int? secondChildFlex;
  const FooterSection({
    Key? key,
    this.mainExpandFlex,
    this.firstChildFlex,
    this.secondChildFlex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: mainExpandFlex ?? 5,
      child: Column(
        children: [
          Expanded(
            flex: firstChildFlex ?? 9,
            child: const SizedBox.shrink(),
          ),
          Expanded(
            flex: secondChildFlex ?? 19,
            child: Row(
              children: const [
                Expanded(
                  child: SizedBox.shrink(),
                ),
                ActionWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
