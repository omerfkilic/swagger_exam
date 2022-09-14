import 'package:flutter/material.dart';
import 'package:swagger_exam/core/services/alpha_auth_api/alpha_auth_api.dart';
import 'package:swagger_exam/pages/login_page/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          icon: const Icon(Icons.logout_sharp),
          onPressed: () {
            logout().then((value) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/LoginPage', (route) => false);
            });
          },
        )
      ]),
      body: Container(),
    );
  }
}
