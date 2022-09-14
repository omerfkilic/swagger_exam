// To parse this JSON data, do
//
//     final graphicModel = graphicModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GraphicModel graphicModelFromJson(String str) =>
    GraphicModel.fromJson(json.decode(str));

String graphicModelToJson(GraphicModel data) => json.encode(data.toJson());

class GraphicModel {
  GraphicModel({
    @required this.data,
    @required this.totalRecords,
    @required this.totalAmount,
  });

  List<GraphicDatum>? data;
  int? totalRecords;
  int? totalAmount;

  factory GraphicModel.fromJson(Map<String, dynamic> json) => GraphicModel(
        data: List<GraphicDatum>.from(
            json["data"].map((x) => GraphicDatum.fromJson(x))),
        totalRecords: json["totalRecords"],
        totalAmount: json["totalAmount"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "totalRecords": totalRecords,
        "totalAmount": totalAmount,
      };
}

class GraphicDatum {
  GraphicDatum({
    @required this.mal,
    @required this.fiyat,
    @required this.ay,
    @required this.yil,
  });

  String? mal;
  double? fiyat;
  int? ay;
  int? yil;

  factory GraphicDatum.fromJson(Map<String, dynamic> json) => GraphicDatum(
        mal: json["MAL"],
        fiyat: json["FIYAT"].toDouble(),
        ay: json["AY"],
        yil: json["YIL"],
      );

  Map<String, dynamic> toJson() => {
        "MAL": mal,
        "FIYAT": fiyat,
        "AY": ay,
        "YIL": yil,
      };
}
