import 'package:login_demo_app/app/models/Card.dart';

extension Sorting on List<Card> {
  List<Card> sortListById() {
    this.sort((a, b) => (a.id).compareTo(b.id));
    return this;
  }
}
