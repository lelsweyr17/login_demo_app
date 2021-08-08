import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login_demo_app/app/global/globals.dart' as globals;
import 'package:login_demo_app/app/models/Card.dart';
import 'package:login_demo_app/app/utils/sort_list_to_map.dart';

class ApiUserDataResponse {
  static Future<List<Card>> fetchCard(index) async {
    List<Card> cards = [];
    var header = 'JWT ' + '${globals.token}';

    final response = await http.get(
      Uri.parse(
          'https://trello.backend.tests.nekidaem.ru/api/v1/cards?row=$index'),
      headers: {HttpHeaders.authorizationHeader: header},
    );

    var jsonData = json.decode(response.body);

    for (var i in jsonData) {
      Card card = Card(
          id: i['id'],
          row: i['row'],
          seqNum: i['seq_num'],
          text: utf8.decode(i['text'].runes.toList()));
      cards.add(card);
    }

    if (response.statusCode == 200) {
      List<Card> cardsMap = SortListToMap.sorting(cards);
      return cardsMap;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
