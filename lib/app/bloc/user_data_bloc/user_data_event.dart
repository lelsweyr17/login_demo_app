abstract class UserDataEvent {}

class GetDataEvent extends UserDataEvent {
  int index;

  GetDataEvent(this.index);
}
