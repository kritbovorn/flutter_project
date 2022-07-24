import 'package:flutter/material.dart';

class ButtonSelected extends StatelessWidget {
  final String name;
  final IconData iconData;
  final Color? textColor;
  final Color? iconColor;
  final Color? primaryColor;
  final VoidCallback onPressed;
  final Color color;
  const ButtonSelected({
    Key? key,
    required this.name,
    required this.iconData,
    this.textColor,
    this.iconColor,
    this.primaryColor,
    required this.onPressed,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(
        iconData,
        color: color,
      ),
      label: Text(
        name,
        style: TextStyle(
          color: color,
              
        ),
      ),
      style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: color,
          minimumSize: const Size(125, 60),
          maximumSize: const Size(125, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          )),
      onPressed: onPressed,
    );
  }
}
