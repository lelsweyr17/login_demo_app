abstract class UserDataEvent {}

class GetDataEvent extends UserDataEvent {
  String row;

  GetDataEvent(this.row);
}
