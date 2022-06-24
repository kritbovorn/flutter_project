import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/widgets.dart';

class SideMenuIconWidgets extends StatelessWidget {
  const SideMenuIconWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SideMenuIconTab(
          iconData: Icons.home,
          title: 'Home',
          onTapped: () {},
        ),
        SideMenuIconTab(
          iconData: Icons.search,
          title: 'Search',
          onTapped: () {},
        ),
        SideMenuIconTab(
          iconData: Icons.audiotrack_rounded,
          title: 'Radio',
          onTapped: () {},
        ),
      ],
    );
  }
}
