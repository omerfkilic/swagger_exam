import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swagger_exam/pages/home_page/home_page.dart';
import 'package:swagger_exam/pages/login_page/login_page.dart';
import 'package:swagger_exam/core/helper/constants.dart' as constants;

void main() async {
  constants.sharedPref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Material App',
      home: LoginPage(),
    );
  }
}
