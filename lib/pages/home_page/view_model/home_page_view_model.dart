import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core/services/alpha_borsa_bulten_api/alpha_borsa_bulten_api.dart';
import '../../../models/kayan_yazi_model.dart';

class HomePageViewModel {
  static HomePageViewModel? _instance = HomePageViewModel._init();
  static HomePageViewModel get instance =>
      _instance ?? HomePageViewModel._init();
  HomePageViewModel._init();
  late KayanYaziModel? kayanYazi;

  Future<KayanYaziModel> getKayanYaziData() async {
    var temp = await kayanYaziAPI();
    Map map = json.decode(temp);
    kayanYazi = kayanYaziModelFromJson(temp);
    return kayanYazi!;
  }

  Stream<KayanYaziModel> getKayanYaziStream() async* {
    var temp = await kayanYaziAPI();
    Map map = json.decode(temp);
    kayanYazi = kayanYaziModelFromJson(temp);
    while (true) {
      await Future.delayed(const Duration(milliseconds: 500));
      temp = await kayanYaziAPI();
      map = json.decode(temp);
      kayanYazi = kayanYaziModelFromJson(temp);
      yield kayanYazi!;
    }
  }
}
