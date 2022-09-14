import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swagger_exam/models/combo_box_model.dart';
import 'package:swagger_exam/models/graphic_model.dart';
import 'package:swagger_exam/pages/home_page/helper/months.dart';

import '../../../core/services/alpha_borsa_bulten_api/alpha_borsa_bulten_api.dart';
import '../../../models/kayan_yazi_model.dart';

class HomePageViewModel {
  static HomePageViewModel? _instance = HomePageViewModel._init();
  static HomePageViewModel get instance =>
      _instance ?? HomePageViewModel._init();
  HomePageViewModel._init();
  late KayanYaziModel? kayanYazi;
  late ComboBoxModel? comboBox;
  late GraphicModel? graphic;
  late ComboBoxDatum? dropDownValue;

  late Map<String, double>? SalesDatas;

  Future<KayanYaziModel> getKayanYaziData() async {
    var temp = await kayanYaziAPI();
    Map map = json.decode(temp);
    kayanYazi = kayanYaziModelFromJson(temp);
    return kayanYazi!;
  }

  Future<ComboBoxModel> getComboBoxData() async {
    print('get combo box');
    String temp = await comboBoxAPI();

    print('combo box done');
    comboBox = comboBoxModelFromJson(temp);
    return comboBox!;
  }

  Future getGraphicData() async {
    String temp = await graphicAPI(malKodu: dropDownValue!.mal!, yil: 'yil');
    graphic = graphicModelFromJson(temp);
    prepareSalesData();
  }

  void prepareSalesData() {
    SalesDatas = {};
    List<GraphicDatum> tempList = graphic!.data!;
    for (var element in tempList) {
      SalesDatas!.addAll({
        mounts[element.ay].toString():
            double.parse(element.fiyat!.toStringAsFixed(2))
      });
    }
    print('Sales Datas ' + SalesDatas.toString());
  }
}
