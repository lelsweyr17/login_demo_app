import 'package:bloc/bloc.dart';
import 'package:login_demo_app/app/bloc/login_bloc/login_event.dart';
import 'package:login_demo_app/app/bloc/login_bloc/login_state.dart';
import 'package:login_demo_app/app/service/api_response.dart';
import 'package:login_demo_app/app/utils/validators.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.empty());

  @override
  LoginState get initialState => LoginState.empty();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginUsernameChange) {
      yield* _mapLoginUsernameChangeToState(event.username);
    } else if (event is LoginPasswordChange) {
      yield* _mapLoginPasswordChangeToState(event.password);
    } else if (event is LoginWithCredentialsPressed) {
      yield* _mapLoginWithCredentialsPressedToState(
          event.username, event.password);
    }
  }

  Stream<LoginState> _mapLoginUsernameChangeToState(String username) async* {
    yield state.update(isUsernameValid: Validators.isValidUsername(username));
    print('username updated');
  }

  Stream<LoginState> _mapLoginPasswordChangeToState(String password) async* {
    yield state.update(isPasswordValid: Validators.isValidPassword(password));
    print('password updated');
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState(
      username, password) async* {
    // TODO: login with 'armada' & 'FSH6zBZ0p9yH'
    yield LoginState.loading();

    try {
      await authenticateUser(username, password);
      yield LoginState.success();
    } catch (e) {
      yield LoginState.failure();
    }
  }
}
