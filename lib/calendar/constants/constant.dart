import 'package:flutter/material.dart';

class Constant {
  static Color primaryColor = const Color(0xFF2B2B2B);
  static Color secondaryColor = const Color(0xFF989898);
  static Color mainColor = Colors.red;
  static Color onMainColor = Colors.white;
}

String getDay(int d) {
  String day = '';
  switch (d) {
    case 1:
      day = "จันทร์";
      break;
    case 2:
      day = "อังคาร";
      break;
    case 3:
      day = "พุธ";
      break;
    case 4:
      day = "พฤหัสบดี";
      break;
    case 5:
      day = "ศุกร์";
      break;
    case 6:
      day = "เสาร์";
      break;
    case 7:
      day = "อาทิตย์";
      break;
    default:
      break;
  }
  return day;
}

String getMonth(int month) {
  String m = '';
  switch (month) {
    case 1:
      m = "มกราคม";
      break;
    case 2:
      m = "กุมภาพันธ์";
      break;
    case 3:
      m = "มีนาคม";
      break;
    case 4:
      m = "เมษายน";
      break;
    case 5:
      m = "พฤษภาคม";
      break;
    case 6:
      m = "มิถุนายน";
      break;
    case 7:
      m = "กรกฎาคม";
      break;
    case 8:
      m = "สิงหาคม";
      break;
    case 9:
      m = "กันยายน";
      break;
    case 10:
      m = "ตุลาคม";
      break;
    case 11:
      m = "พฤศจิกายน";
      break;
    case 12:
      m = "ธันวาคม";
      break;
    default:
      break;
  }
  return m;
}
