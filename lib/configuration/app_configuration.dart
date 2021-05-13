import 'package:flutter/material.dart';

class AppConfig {
  static const Color kPrimaryColor = Color(0xFF0095D6);
  static const Color kSecondaryColor = Color(0xFFE9573F);

  static double screenWidth(context) => MediaQuery.of(context).size.width;
  static double screenHeight(context) => MediaQuery.of(context).size.height;
}
