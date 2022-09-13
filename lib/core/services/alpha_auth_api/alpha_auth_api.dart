import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'package:swagger_exam/core/services/alpha_auth_api/api_keys.dart'
    as apiKeys;

Future<void> login({required String userId, required String password}) async {
  final body = {
    'kullaniciAdi': 'teknoloji@alpata.com',
    'sifre': 'Alpata123.',
    'requestId': const Uuid().v1()
  };
  final headers = {"Accept": "text/plain", "Content-Type": "application/json"};
  final uri = Uri.parse(apiKeys.loginUrl);

  final response = await http.post(uri,
      body: jsonEncode(body),
      headers: headers,
      encoding: Encoding.getByName("utf-8"));
  //TODO response'da hata olup olmadığını inceleyen if else yapısı kur

  print(response.body);
}
