import 'package:bloc/bloc.dart';
import 'package:login_demo_app/app/bloc/login_bloc/login_event.dart';
import 'package:login_demo_app/app/bloc/login_bloc/login_state.dart';
import 'package:login_demo_app/app/service/api_login_response.dart';
import 'package:login_demo_app/app/utils/validators.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.empty());

  @override
  LoginState get initialState => LoginState.empty();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginUsernameChange) {
      print('username updated');
      yield* _mapLoginUsernameChangeToState(event.username);
    } else if (event is LoginPasswordChange) {
      print('password updated');
      yield* _mapLoginPasswordChangeToState(event.password);
    } else if (event is LoginWithCredentialsPressed) {
      print('login with credentials');
      yield* _mapLoginWithCredentialsPressedToState(
          event.username, event.password);
    }
  }

  Stream<LoginState> _mapLoginUsernameChangeToState(String username) async* {
    yield state.update(isUsernameValid: Validators.isValidUsername(username));
  }

  Stream<LoginState> _mapLoginPasswordChangeToState(String password) async* {
    yield state.update(isPasswordValid: Validators.isValidPassword(password));
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState(
      username, password) async* {
    // TODO: login with 'armada' & 'FSH6zBZ0p9yH'
    yield LoginState.loading();

    try {
      await ApiLoginResponse.authenticateUser(username, password);
      yield LoginState.success();
    } catch (e) {
      yield LoginState.failure();
    }
  }
}
