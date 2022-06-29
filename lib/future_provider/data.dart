// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Data {
  String data;
  Data({
    required this.data,
  });

  Future<void> loadedData() async {
    await Future.delayed(const Duration(seconds: 1));
    data = 'New Data from Server: , triggered by click button';
    debugPrint(data);
  }
}
