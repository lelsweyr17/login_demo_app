import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> authenticateUser(String username, String password) async {
  final response = await http.post(
      Uri.parse('https://trello.backend.tests.nekidaem.ru/api/v1/users/login/'),
      body: {
        'username': username,
        'password': password,
      });

  switch (response.statusCode) {
    case 200:
      break;
    case 400:
      throw Exception('400 error');
    default:
      throw Exception('login failure');
  }
}

class User {
  String _username = '';
  String _password = '';

  User(this._username, this._password);

  String get userName => this._username;
  set userName(String username) => this._username = username;

  String get passWord => this._password;
  set passWord(String password) => this._password = password;

  User.fromJson(Map<String, dynamic> json) {
    _username = json['username'];
    _password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['username'] = this._username;
    data['password'] = this._password;
    return data;
  }
}
