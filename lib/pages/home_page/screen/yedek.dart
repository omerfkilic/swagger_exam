import 'package:flutter/material.dart';
import 'package:swagger_exam/pages/home_page/view_model/home_page_view_model.dart';

import '../../../models/kayan_yazi_model.dart';

class YedePage extends StatefulWidget {
  YedePage({Key? key}) : super(key: key);

  @override
  State<YedePage> createState() => _YedePageState();
}

class _YedePageState extends State<YedePage> {
  @override
  void initState() {
    _();
    super.initState();
  }

  KayanYaziModel? kym;
  void _() async {
    await HomePageViewModel.instance.getKayanYaziData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('kym!.data!.length.toString()'),
    );
  }
}
