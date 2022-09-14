import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swagger_exam/pages/home_page/screen/home_page.dart';
import 'package:swagger_exam/pages/login_page/screen/login_page.dart';
import 'package:swagger_exam/core/helper/shared_pref.dart' as shared_pref;

void main() async {
  shared_pref.sharedPref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Material App',
      routes: {
        '/HomePage': (context) => const HomePage(),
        '/LoginPage': (context) => LoginPage(),
      },
      home: shared_pref.sharedPref.containsKey('token')
          ? const HomePage()
          : LoginPage(),
    );
  }
}
