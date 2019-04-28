import 'dart:convert';

import 'package:hayum/models/auth_model.dart';
import 'package:http/http.dart' show Client;

class AuthService {
  Client _client = Client();

  // TODO: extract this to a config file
  String _url = "10.0.0.199:8080/api/v1";

  Future<Auth> loginUser(Map<String, dynamic> data) async {
    try {
      final response = await _client.post(new Uri.http(_url, "/login"),
          body: jsonEncode(data));
      final statusCode = response.statusCode;

      if (statusCode == 200) {
        return Auth.fromJson(json.decode(response.body));
      }
      throw Exception("Failed with status: " + statusCode.toString());
    } catch (e) {
      print(e);
    }

    return null;
  }
}
