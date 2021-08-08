import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login_demo_app/app/service/api_user_data_response.dart';
import 'package:login_demo_app/app/global/globals.dart' as globals;

class ApiLoginResponse {
  static Future<void> authenticateUser(String username, String password) async {
    final response = await http.post(
        Uri.parse(
            '${globals.url}/users/login/'),
        body: {
          'username': username,
          'password': password,
        });

    switch (response.statusCode) {
      case 200:
        globals.token = jsonDecode(response.body)['token'];
        ApiUserDataResponse.fetchCard(0);
        break;
      case 400:
        throw Exception('400 error');
      default:
        throw Exception('login failure');
    }
  }
}
