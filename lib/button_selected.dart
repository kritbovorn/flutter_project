// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ButtonSelected extends StatelessWidget {
  final String name;
  final IconData iconData;
  final Color? textColor;
  final Color? iconColor;
  final Color? primaryColor;
  final VoidCallback onPressed;
  final bool isPress;
  const ButtonSelected({
    Key? key,
    required this.name,
    required this.iconData,
    this.textColor,
    this.iconColor,
    this.primaryColor,
    required this.onPressed,
    required this.isPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(
        iconData,
        color: isPress ? const Color.fromARGB(255, 226, 226, 226) : Colors.blue,
      ),
      label: Text(
        name,
        style: TextStyle(
          color:
              isPress ? const Color.fromARGB(255, 226, 226, 226) : Colors.blue,
        ),
      ),
      style: ElevatedButton.styleFrom(
          elevation: 0,
          primary:
              isPress ? Colors.blue : const Color.fromARGB(255, 226, 226, 226),
          minimumSize: const Size(125, 60),
          maximumSize: const Size(125, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          )),
      onPressed: onPressed,
    );
  }
}
