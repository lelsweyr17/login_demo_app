import 'package:login_demo_app/app/models/Card.dart';

class SortListToMap {
  static Map<int, List<Card>> sorting(cards) {
    List<Card> nul = [];
    List<Card> one = [];
    List<Card> two = [];
    List<Card> three = [];

    for (int i = 0; i < cards.length; i++) {
      // print(cards[i].text);
      if (cards[i].row == '0') {
        // print('row 0');
        nul.add(cards[i]);
      } else if (cards[i].row == '1') {
        // print('row 1');
        one.add(cards[i]);
      } else if (cards[i].row == '2') {
        // print('row 2');
        two.add(cards[i]);
      } else if (cards[i].row == '3') {
        // print('row 3');
        three.add(cards[i]);
      }
    }

    print('______________________');
    Map<int, List<Card>> cardsMap = {0: nul, 1: one, 2: two, 3: three};
    print('0: ${cardsMap[0]!.length}');
    print('1: ${cardsMap[1]!.length}');
    print('2: ${cardsMap[2]!.length}');
    print('3: ${cardsMap[3]!.length}');
    var values = cardsMap.values.toList();
    for (int i = 0; i < cardsMap.length; i++) {
      for (int j = 0; j < values[i].length; j++) {
        print(values[i][j].text);
      }
    }
    // for (int i = 0; i < nul.length; i++) {
    //   print('nul : ${nul[i].text}');
    // }
    print('______________________');
    return cardsMap;
  }
}
