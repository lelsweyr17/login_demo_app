import 'package:login_demo_app/app/models/Card.dart';

abstract class UserDataState {}

class LoadingDataState extends UserDataState {}

class LoadedDataState extends UserDataState {
  List<Card> cards;

  LoadedDataState(this.cards);
}

class LoadingDataErrorState extends UserDataState {}
