import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:swagger_exam/models/kayan_yazi_model.dart';
import 'package:swagger_exam/pages/home_page/view_model/home_page_view_model.dart';
import '../../../core/services/alpha_auth_api/alpha_auth_api.dart';
import '../../../core/services/alpha_borsa_bulten_api/alpha_borsa_bulten_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = '';
  @override
  void initState() {
    //kayanYaziAPI().then((value) => data = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_sharp),
            onPressed: () {
              logout().then((value) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/LoginPage', (route) => false);
              });
            },
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          ElevatedButton(
            child: Text('Get Data'),
            onPressed: () async {
              await HomePageViewModel.instance.getKayanYaziData();
              setState(() {
                data =
                    HomePageViewModel.instance.kayanYazi!.toJson().toString();
              });
            },
          ),
          Text(data)
        ],
      ),
    );
  }
}
