import 'package:login_demo_app/app/models/Card.dart';

class SortListToMap {
  static Map<int, List<Card>> sorting(List<Card> cards) {
    List<Card> onHold = [];
    List<Card> inProgress = [];
    List<Card> needsReview = [];
    List<Card> approved = [];

    Map<int, List<Card>> cardsMap = {
      0: onHold,
      1: inProgress,
      2: needsReview,
      3: approved
    };

    cards.sort((a, b) => (a.id).compareTo(b.id));

    for (int i = 0; i < cards.length; i++) {
      if (cards[i].row == '0') {
        onHold.add(cards[i]);
      } else if (cards[i].row == '1') {
        inProgress.add(cards[i]);
      } else if (cards[i].row == '2') {
        needsReview.add(cards[i]);
      } else if (cards[i].row == '3') {
        approved.add(cards[i]);
      }
    }

    return cardsMap;
  }
}
