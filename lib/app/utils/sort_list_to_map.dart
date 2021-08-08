import 'package:login_demo_app/app/models/Card.dart';

class SortListToMap {
  static List<Card> sorting(List<Card> cards) {
    cards.sort((a, b) => (a.id).compareTo(b.id));
    return cards;
  }
}
