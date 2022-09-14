import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swagger_exam/core/helper/shared_pref.dart' as shared_pref;

Future<String> kayanYaziAPI() async {
  final header = {
    "Accept": "text/plain",
    "Content-Type": "application/json",
    "Authorization": "Bearer ${shared_pref.sharedPref.get('token')}"
  };
  final body = {"first": "0", "rows": "0"};

  const url =
      "http://api.alpatateknoloji.com/api/v1/Alpha.Borsa.Bulten/Genel/GetKayanYazi";
  //"http://api.alpatateknoloji.com/api/v1/Alpha.Borsa.Bulten/Genel/GetUrunlerSelect";

  final uri = Uri.parse(url);

  final response = await http.post(uri,
      body: jsonEncode(body),
      headers: header,
      encoding: Encoding.getByName("utf-8"));
  print("status code " + response.statusCode.toString());
  print("body " + response.body);
  return response.body;
}

Future<String> comboBoxAPI() async {
  final header = {
    "Accept": "text/plain",
    "Content-Type": "application/json",
    "Authorization": "Bearer ${shared_pref.sharedPref.get('token')}"
  };
  final body = {"first": "0", "rows": "0"};

  const url =
      "http://api.alpatateknoloji.com/api/v1/Alpha.Borsa.Bulten/Genel/GetUrunlerSelect";

  final uri = Uri.parse(url);
  final response = await http.post(uri,
      body: jsonEncode(body),
      headers: header,
      encoding: Encoding.getByName("utf-8"));
  print("status code " + response.statusCode.toString());
  print("body " + response.body);
  return response.body;
}

Future<String> graphicAPI(
    {required String malKodu, required String yil}) async {
  final header = {
    "Accept": "/",
    "Authorization": "Bearer ${shared_pref.sharedPref.get('token')}"
  };
  final body = '';

  var url =
      "https://api.alpatateknoloji.com/api/v1/Alpha.Borsa.Bulten/Genel/GetSatisVerileriYilGrafik?malKodu=$malKodu&yil=2020";

  final uri = Uri.parse(url);

  final response = await http.post(uri,
      body: jsonEncode(body),
      headers: header,
      encoding: Encoding.getByName("utf-8"));
  print("status code " + response.statusCode.toString());
  print("body " + response.body);
  return response.body;
}
