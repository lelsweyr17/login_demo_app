import 'dart:io';
import 'dart:convert';
import 'dart:convert' show utf8;
import 'package:http/http.dart' as http;
import 'package:login_demo_app/app/models/card.dart';

Future<void> authenticateUser(String username, String password) async {
  final response = await http.post(
      Uri.parse('https://trello.backend.tests.nekidaem.ru/api/v1/users/login/'),
      body: {
        'username': username,
        'password': password,
      });

  switch (response.statusCode) {
    case 200:
      String token = jsonDecode(response.body)['token'];
      fetchCard(token);
      break;
    case 400:
      throw Exception('400 error');
    default:
      throw Exception('login failure');
  }
}

Future<List<Card>> fetchCard(String token) async {
  List<Card> cards = [];
  var header = 'JWT ' + '$token';

  final response = await http.get(
    Uri.parse('https://trello.backend.tests.nekidaem.ru/api/v1/cards/'),
    headers: {HttpHeaders.authorizationHeader: header},
  );

  var jsonData = json.decode(response.body);

  for (var i in jsonData) {
    // strange cart texts (???)
    Card card = Card(
        id: i['id'],
        row: i['row'],
        seq_num: i['seq_num'],
        text: utf8.decode(i['text'].runes.toList()));
    // print('id: ${i['id']}');
    // print('row: ${i['row']}');
    // print('seq_num: ${i['seq_num']}');
    // print('text: ${utf8.decode(i['text'].runes.toList())}');
    // print('_______________________________________________');
    cards.add(card);
  }

  if (response.statusCode == 200) {
    return cards;
  } else {
    throw Exception('Failed to load data');
  }
}
