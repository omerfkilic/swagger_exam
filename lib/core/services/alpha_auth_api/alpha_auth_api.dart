import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'package:swagger_exam/core/helper/shared_pref.dart' as shared_pref;
import 'package:swagger_exam/core/services/alpha_auth_api/api_keys.dart'
    as api_keys;

Future<void> login({required String userId, required String password}) async {
  final loginBody = {
    'kullaniciAdi': 'teknoloji@alpata.com',
    'sifre': 'Alpata123.',
    'requestId': await _generateRequestId()
  };

  final loginHeaders = {
    "Accept": "text/plain",
    "Content-Type": "application/json"
  };
  final uri = Uri.parse(api_keys.loginUrl);

  final response = await http.post(uri,
      body: jsonEncode(loginBody),
      headers: loginHeaders,
      encoding: Encoding.getByName("utf-8"));
  Map map = json.decode(response.body);
  print(map['token']);
  await shared_pref.sharedPref.setString('authToken', map['token']!);

  //TODO response'da hata olup olmadığını inceleyen if else yapısı kur

  print('Login body : ' + response.body);
  await _getAuthToken();
}

Future<void> logout() async {
  await shared_pref.sharedPref.clear();
  print('logged out');
}

Future<String> _generateRequestId() async {
  String requestId = const Uuid().v1();
  await shared_pref.sharedPref.setString('requestId', requestId);
  return requestId;
}

Future _getAuthToken() async {
  final authTokenBody = {
    "requestId": shared_pref.sharedPref.get('requestId'),
    "authToken": shared_pref.sharedPref.get('authToken'),
    "authCode": ""
  };
  final authTokenHeaders = {"Accept": "/", "Content-Type": "application/json"};
  final uri = Uri.parse(api_keys.authTokenUrl);

  final response = await http.post(uri,
      body: jsonEncode(authTokenBody),
      headers: authTokenHeaders,
      encoding: Encoding.getByName("utf-8"));

  Map map = json.decode(response.body);
  print(map['token']);
  await shared_pref.sharedPref.setString('token', map['token']!);
}
