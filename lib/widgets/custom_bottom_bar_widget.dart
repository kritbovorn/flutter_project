// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomBottomBarWidget extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? padding;
  const CustomBottomBarWidget({
    Key? key,
    required this.child,
    this.color,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom,
        left: padding ?? 12,
        right: padding ?? 12,
      ),
      height:
          kBottomNavigationBarHeight + MediaQuery.of(context).padding.bottom,
      color: color ?? Theme.of(context).colorScheme.onPrimary,
      child: child,
    );
  }
}
