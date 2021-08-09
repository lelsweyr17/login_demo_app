import 'package:login_demo_app/app/models/Card.dart';

class Sorting {
  static List<Card> sortListById(List<Card> cards) {
    cards.sort((a, b) => (a.id).compareTo(b.id));
    return cards;
  }
}
