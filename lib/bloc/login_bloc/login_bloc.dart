import 'package:bloc/bloc.dart';
import 'package:login_demo_app/bloc/login_bloc/login_event.dart';
import 'package:login_demo_app/bloc/login_bloc/login_state.dart';
import 'package:login_demo_app/utils/validators.dart';

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
    print('username update');
  }

  Stream<LoginState> _mapLoginPasswordChangeToState(String password) async* {
    yield state.update(isPasswordValid: Validators.isValidPassword(password));
    print('password update');
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState(
      username, password) async* {
    // TODO: login with 'armada' & 'FSH6zBZ0p9yH'
    yield LoginState.loading();
    if (state.isFormValid == true) {
      yield LoginState.success();
      print('login success');
    } else {
      yield LoginState.failure();
      print('login failure');
    }
    // do with repository
    // try {
    //   await _userRepository.sighInWithCredentials(username, password);
    //   yield LoginState.success();
    // } catch (_) {
    //   yield LoginState.failure();
    // }
  }
}
