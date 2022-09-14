import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swagger_exam/models/combo_box_model.dart';

import '../../../core/services/alpha_borsa_bulten_api/alpha_borsa_bulten_api.dart';
import '../../../models/kayan_yazi_model.dart';

class HomePageViewModel {
  static HomePageViewModel? _instance = HomePageViewModel._init();
  static HomePageViewModel get instance =>
      _instance ?? HomePageViewModel._init();
  HomePageViewModel._init();
  late KayanYaziModel? kayanYazi;
  late ComboBoxModel? comboBox;
  //late List<DropdownMenuItem<ComboBoxDatum>> comboBoxTrDropDownList = [];
  //late ComboBoxDatum comboBoxDropDownSelectedItem;

  Future<KayanYaziModel> getKayanYaziData() async {
    var temp = await kayanYaziAPI();
    Map map = json.decode(temp);
    kayanYazi = kayanYaziModelFromJson(temp);
    return kayanYazi!;
  }

  Future<ComboBoxModel> getComboBoxData() async {
    print('get Combo BOx');
    String temp = await comboBoxAPI();

    print('combo box done');
    comboBox = comboBoxModelFromJson(temp);
    //prepereComboBoxData();
    return comboBox!;
  }

  // void prepereComboBoxData() {
  //   for (var i = 0; i < comboBox!.data!.length; i++) {
  //     if (comboBox!.data![i].dil == '1') {
  //       comboBoxTrDropDownList.add(
  //         DropdownMenuItem(
  //           child: Text(comboBox!.data![i].maladi.toString()),
  //           value: comboBox!.data![i],
  //         ),
  //       );
  //     }
  //   }
  //   comboBoxDropDownSelectedItem = comboBoxTrDropDownList.first.value!;
  //   print(comboBoxTrDropDownList[1].value);
  // }
}
