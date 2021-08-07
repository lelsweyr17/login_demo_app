import 'package:bloc/bloc.dart';
import 'package:login_demo_app/app/bloc/user_data_bloc.dart/user_data_event.dart';
import 'package:login_demo_app/app/bloc/user_data_bloc.dart/user_data_state.dart';
import 'package:login_demo_app/app/models/Card.dart';
import 'package:login_demo_app/app/service/api_user_data_response.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  UserDataBloc() : super(LoadingDataState());

  @override
  Stream<UserDataState> mapEventToState(UserDataEvent event) async* {
    if (event is GetDataEvent) {
      try {
        yield LoadingDataState();
        final List<Card> cards = await ApiUserDataResponse.fetchCard();
        yield LoadedDataState(cards);
      } catch (_) {
        yield LoadingDataErrorState();
      }
    }
  }
}
