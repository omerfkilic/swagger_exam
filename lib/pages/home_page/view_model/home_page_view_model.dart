import 'dart:convert';

import '../../../core/services/alpha_borsa_bulten_api/alpha_borsa_bulten_api.dart';
import '../../../models/kayan_yazi_model.dart';

class HomePageViewModel {
  static HomePageViewModel? _instance = HomePageViewModel._init();
  static HomePageViewModel get instance =>
      _instance ?? HomePageViewModel._init();
  HomePageViewModel._init();
  late KayanYaziModel? kayanYazi;

  Future getKayanYaziData() async {
    var temp = await kayanYaziAPI();
    Map map = json.decode(temp);
    kayanYazi = kayanYaziModelFromJson(temp);
  }
}
