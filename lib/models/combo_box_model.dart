// To parse this JSON data, do
//
//     final comboBoxModel = comboBoxModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ComboBoxModel comboBoxModelFromJson(String str) =>
    ComboBoxModel.fromJson(json.decode(str));

String comboBoxModelToJson(ComboBoxModel data) => json.encode(data.toJson());

class ComboBoxModel {
  ComboBoxModel({
    @required this.data,
    @required this.totalRecords,
    @required this.totalAmount,
  });

  List<ComboBoxDatum>? data;
  int? totalRecords;
  int? totalAmount;

  factory ComboBoxModel.fromJson(Map<String, dynamic> json) => ComboBoxModel(
        data: List<ComboBoxDatum>.from(
            json["data"].map((x) => ComboBoxDatum.fromJson(x))),
        totalRecords: json["totalRecords"],
        totalAmount: json["totalAmount"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "totalRecords": totalRecords,
        "totalAmount": totalAmount,
      };
}

class ComboBoxDatum {
  ComboBoxDatum({
    @required this.mal,
    @required this.maladi,
    @required this.dil,
  });

  String? mal;
  String? maladi;
  String? dil;

  factory ComboBoxDatum.fromJson(Map<String, dynamic> json) => ComboBoxDatum(
        mal: json["MAL"],
        maladi: json["MALADI"],
        dil: json["DIL"],
      );

  Map<String, dynamic> toJson() => {
        "MAL": mal,
        "MALADI": maladi,
        "DIL": dil,
      };
}
