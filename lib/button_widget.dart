import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onPressed;
  final Color? primaryColor;
  final Color? textColor;
  final Color? iconColor;
  const ButtonWidget({
    Key? key,
    required this.iconData,
    required this.title,
    required this.onPressed,
    this.primaryColor,
    this.textColor = Colors.black,
    this.iconColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          elevation: 0,
          side: BorderSide.none,
          primary: primaryColor ?? const Color.fromARGB(255, 226, 226, 226),
          minimumSize: const Size(110, 60),
          maximumSize: const Size(110, 60),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: iconColor,
          ),
          Text(
            title,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
