import 'dart:io';
import 'dart:convert';
import 'dart:convert' show utf8;
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
      token = jsonDecode(response.body)['token'];
      fetchCard();
      break;
    case 400:
      throw Exception('400 error');
    default:
      throw Exception('login failure');
  }
}

Future fetchCard() async {
  List<Card> cards = [];
  var header = 'JWT ' + '$token';

  final response = await http.get(
    Uri.parse('https://trello.backend.tests.nekidaem.ru/api/v1/cards/'),
    headers: {HttpHeaders.authorizationHeader: header},
  );

  var jsonData = json.decode(response.body);

  for (var i in jsonData) {
    Card card = Card(row: i['row'], text: i['text']);
    print(i['row']);
    print(utf8.decode(i['text'].runes.toList()));
    cards.add(card);
  }
}

class Card {
  final int id;
  final String row;
  final int seq_num;
  final String text;

  Card({this.id = 0, required this.row, this.seq_num = 0, required this.text});
}
