import 'package:covidwb/configuration/app_configuration.dart';
import 'package:covidwb/core/screens/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid19-Helpline WB',
      theme: ThemeData(
        primaryColor: AppConfig.kPrimaryColor,
        accentColor: AppConfig.kSecondaryColor,
        fontFamily: 'Poppins',
      ),
      home: HomeScreen(),
    );
  }
}
