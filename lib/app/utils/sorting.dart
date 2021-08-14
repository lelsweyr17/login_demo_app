import 'package:login_demo_app/app/models/Card.dart';

extension Sorting on List<Card> {
  List<Card> sortListById(List<Card> cards) {
    cards.sort((a, b) => (a.id).compareTo(b.id));
    return cards;
  }
}
