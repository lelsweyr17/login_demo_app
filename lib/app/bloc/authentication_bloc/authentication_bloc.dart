import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_demo_app/app/bloc/authentication_bloc/authentication_event.dart';
import 'package:login_demo_app/app/bloc/authentication_bloc/authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(Unathenticated());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStarted) {
      yield Unathenticated();
    } else if (event is LoggedIn) {
      await Future.delayed(Duration(milliseconds: 700));
      yield Authenticated();
    } else if (event is LoggedOut) {
      yield Unathenticated();
    }
  }
}
