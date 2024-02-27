import 'package:flutter/material.dart';

class ColorManager {
  static const primaryColor = Color.fromARGB(255, 13, 41, 83);
  static const lightGrey = Color.fromARGB(255, 241, 241, 241);
  static const mediumGrey = Color.fromARGB(255, 224, 224, 224);

  static const grey = Colors.grey;
  static const darkGrey = Color.fromARGB(255, 105, 105, 105);
  static const whiteColor = Colors.white;
  static const darkColor = Colors.black87;
  static const redColor = Colors.red;
  static const goldenColor = Color.fromARGB(255, 212, 157, 5);
  static const Color primaryAccentColor = Color(0xFF73D5FF);
  static const Color blackColor = Colors.black;
  static const Color disabledColor = Color(0xFF6D6D6D);
  static const Color blackColorWhiteOpacity = Colors.white12;
  static const Color scaffoldBackGroundColor =
      Color.fromARGB(255, 225, 235, 255);
  static const Color sectionBackGroundColor = Color(0xFFF2F2F2);
  static const Color primaryTextColor = Color(0xFF3D3D3D);
  static const Color secondaryTextColor = Color(0xFF6C6C6C);
  static const Color greenColor = Colors.green;

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
