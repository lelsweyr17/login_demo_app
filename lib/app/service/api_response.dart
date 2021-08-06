import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

String token = '';

Future<void> authenticateUser(String username, String password) async {
  final response = await http.post(
      Uri.parse('https://trello.backend.tests.nekidaem.ru/api/v1/users/login/'),
      body: {
        'username': username,
        'password': password,
      });

  switch (response.statusCode) {
    case 200:
      var jsonData = json.decode(response.body);
      token = jsonData['token'].split('.')[0];
      print('token: $token');
      fetchCard();
      break;
    case 400:
      throw Exception('400 error');
    default:
      throw Exception('login failure');
  }
}

Future fetchCard() async {
  var header = '$token';
  print('JWT: $header');
  final response = await http.get(
    Uri.parse('https://trello.backend.tests.nekidaem.ru/api/v1/cards/'),
    headers: {HttpHeaders.authorizationHeader: header},
  );
  print(response.body);
}

// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;

// String token = '';

// Future<void> authenticateUser(String username, String password) async {
//   final response = await http.post(
//       Uri.parse('https://trello.backend.tests.nekidaem.ru/api/v1/users/login/'),
//       body: {
//         'username': username,
//         'password': password,
//       });

//   switch (response.statusCode) {
//     case 200:
//       var jsonData = json.decode(ascii.decode(
//           base64.decode(base64.normalize(response.body.split(".")[1]))));
//       token = json.decode(response.body.split('.')[0]);
//       print(jsonData);
//       print(token);
//       fetchCard();
//       break;
//     case 400:
//       throw Exception('400 error');
//     default:
//       throw Exception('login failure');
//   }
// }

// Future fetchCard() async {
//   var header = 'JWT ' + token;
//   final response = await http.get(
//     Uri.parse('https://trello.backend.tests.nekidaem.ru/api/v1/cards/'),
//     headers: {HttpHeaders.authorizationHeader: header},
//   );
//   print(token);
//   final responseJson = jsonDecode(response.body);
//   print(responseJson);
// }

