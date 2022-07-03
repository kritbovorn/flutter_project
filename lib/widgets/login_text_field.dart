// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final Widget icon;
  final String hintText;
  final bool? isSecure;
  final double? paddingBottom;
  final Color? textColor;
  final Color? fillColor;
  final double? fontSize;
  const LoginTextField({
    Key? key,
    required this.icon,
    required this.hintText,
    this.isSecure,
    this.paddingBottom,
    this.textColor,
    this.fillColor,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: paddingBottom ?? 16),
      child: TextFormField(
        obscureText: isSecure ?? false,
        enableSuggestions: false,
        autocorrect: false,
        style: TextStyle(
          color: textColor ?? Colors.black,
          fontSize: fontSize ?? 16,
        ),
        decoration: InputDecoration(
          fillColor: fillColor ?? Colors.white70,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Container(
            alignment: Alignment.center,
            width: 60,
            child: icon,
          ),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: fontSize ?? 16),
          contentPadding: const EdgeInsets.all(1),
        ),
      ),
    );
  }
}
