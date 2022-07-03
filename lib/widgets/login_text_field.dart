// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final Widget icon;
  final String hintText;
  const LoginTextField({
    Key? key,
    required this.icon,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white70,
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
          hintStyle: const TextStyle(fontSize: 15),
          contentPadding: const EdgeInsets.all(1),
        ),
      ),
    );
  }
}
