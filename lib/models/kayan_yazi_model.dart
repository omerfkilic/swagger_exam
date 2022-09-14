// To parse this JSON data, do
//
//     final kayanYaziModel = kayanYaziModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

KayanYaziModel kayanYaziModelFromJson(String str) =>
    KayanYaziModel.fromJson(json.decode(str));

String kayanYaziModelToJson(KayanYaziModel data) => json.encode(data.toJson());

class KayanYaziModel {
  KayanYaziModel({
    @required this.data,
    @required this.totalRecords,
    @required this.totalAmount,
  });

  List<KayanYaziDatum>? data;
  int? totalRecords;
  int? totalAmount;

  factory KayanYaziModel.fromJson(Map<String, dynamic> json) => KayanYaziModel(
        data: List<KayanYaziDatum>.from(
            json["data"].map((x) => KayanYaziDatum.fromJson(x))),
        totalRecords: json["totalRecords"],
        totalAmount: json["totalAmount"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "totalRecords": totalRecords,
        "totalAmount": totalAmount,
      };
}

class KayanYaziDatum {
  KayanYaziDatum({
    @required this.fTarih,
    @required this.tarih,
    @required this.mal,
    @required this.dil,
    @required this.maladi,
    @required this.kilo,
    @required this.adet,
    @required this.enAz,
    @required this.enCok,
    @required this.ort,
    @required this.satilanBekleyenler,
    @required this.isletmeId,
    @required this.firmaId,
    @required this.subeId,
    @required this.yil,
    @required this.authInfo,
    @required this.id,
    @required this.silindi,
    @required this.revizyon,
    @required this.guid,
    @required this.aktif,
    @required this.onaylandi,
  });

  String? fTarih;
  DateTime? tarih;
  String? mal;
  String? dil;
  String? maladi;
  int? kilo;
  String? adet;
  double? enAz;
  double? enCok;
  double? ort;
  dynamic? satilanBekleyenler;
  int? isletmeId;
  int? firmaId;
  int? subeId;
  int? yil;
  dynamic? authInfo;
  int? id;
  bool? silindi;
  int? revizyon;
  String? guid;
  bool? aktif;
  bool? onaylandi;

  factory KayanYaziDatum.fromJson(Map<String, dynamic> json) => KayanYaziDatum(
        fTarih: json["FTarih"],
        tarih: DateTime.parse(json["TARIH"]),
        mal: json["MAL"],
        dil: json["DIL"],
        maladi: json["MALADI"],
        kilo: json["KILO"],
        adet: json["Adet"],
        enAz: json["EnAz"].toDouble(),
        enCok: json["EnCok"].toDouble(),
        ort: json["Ort"].toDouble(),
        satilanBekleyenler: json["SatilanBekleyenler"],
        isletmeId: json["IsletmeId"],
        firmaId: json["FirmaId"],
        subeId: json["SubeId"],
        yil: json["Yil"],
        authInfo: json["AuthInfo"],
        id: json["Id"],
        silindi: json["Silindi"],
        revizyon: json["Revizyon"],
        guid: json["Guid"],
        aktif: json["Aktif"],
        onaylandi: json["Onaylandi"],
      );

  Map<String, dynamic> toJson() => {
        "FTarih": fTarih,
        "TARIH": tarih!.toIso8601String(),
        "MAL": mal,
        "DIL": dil,
        "MALADI": maladi,
        "KILO": kilo,
        "Adet": adet,
        "EnAz": enAz,
        "EnCok": enCok,
        "Ort": ort,
        "SatilanBekleyenler": satilanBekleyenler,
        "IsletmeId": isletmeId,
        "FirmaId": firmaId,
        "SubeId": subeId,
        "Yil": yil,
        "AuthInfo": authInfo,
        "Id": id,
        "Silindi": silindi,
        "Revizyon": revizyon,
        "Guid": guid,
        "Aktif": aktif,
        "Onaylandi": onaylandi,
      };
}
