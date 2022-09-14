import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swagger_exam/pages/home_page/helper/sales_graphic.dart';
import 'package:swagger_exam/pages/home_page/screen/home_page.dart';
import 'package:swagger_exam/pages/login_page/screen/login_page.dart';
import 'package:swagger_exam/core/helper/shared_pref.dart' as shared_pref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
          '/': (context) => const FirstPage(),
          '/LoginPage': (context) => LoginPage(),
          '/HomePage': (context) => HomePage(),
        },
        initialRoute: shared_pref.sharedPref.containsKey('token')
            ? '/HomePage'
            : '/LoginPage');
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
