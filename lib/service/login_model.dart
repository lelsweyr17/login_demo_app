import 'dart:convert';
import 'package:http/http.dart' as http;

Future authenticateUser(String username, String password) async {
  ApiResponse _apiResponse = ApiResponse();

  try {
    final response = await http.post(
        Uri.parse(
            'https://trello.backend.tests.nekidaem.ru/api/v1/users/login/'),
        body: {
          'username': username,
          'password': password,
        });

    switch (response.statusCode) {
      case 200:
        print('login success');
        _apiResponse.Data = User.fromJson(json.decode(response.body));
        break;
      default:
        print('login failure');
        break;
    }
  } catch (e) {}
}

class ApiResponse {
  // _data will hold any response converted into
  // its own object. For example user.
  Object _data = Object();
  // _apiError will hold the error object
  Object _apiError = Object();

  Object get Data => _data;
  set Data(Object data) => _data = data;

  Object get ApiError => _apiError as Object;
  set ApiError(Object error) => _apiError = error;
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
