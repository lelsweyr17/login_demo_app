import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_demo_app/bloc/authentication_bloc/authentication_event.dart';
import 'package:login_demo_app/bloc/authentication_bloc/authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(Unknown());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
  }
}
