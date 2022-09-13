import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'package:swagger_exam/core/helper/constants.dart' as constants;
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
  constants.sharedPref.setString('authToken', map['token']!);

  //TODO response'da hata olup olmadığını inceleyen if else yapısı kur

  print('Login body : ' + response.body);
  _getAuthToken();
}

Future<String> _generateRequestId() async {
  String requestId = const Uuid().v1();
  await constants.sharedPref.setString('requestId', requestId);
  return requestId;
}

void _getAuthToken() async {
  final authTokenBody = {
    "requestId": constants.sharedPref.get('requestId'),
    "authToken": constants.sharedPref.get('authToken'),
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
  constants.sharedPref.setString('token', map['token']!);
}
