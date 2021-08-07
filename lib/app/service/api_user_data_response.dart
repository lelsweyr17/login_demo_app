import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login_demo_app/app/models/Card.dart';

class ApiUserDataResponse {
  static Future<List<Card>> fetchCard(String token) async {
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
}
