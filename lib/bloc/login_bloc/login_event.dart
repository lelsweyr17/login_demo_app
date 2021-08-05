abstract class LoginEvent {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUsernameChange extends LoginEvent {
  final String username;

  LoginUsernameChange(this.username);

  @override
  List<Object> get props => [username];
}

class LoginPasswordChange extends LoginEvent {
  final String password;

  LoginPasswordChange(this.password);

  @override
  List<Object> get props => [password];
}

class LoginWithCredentialsPressed extends LoginEvent {
  final String username;
  final String password;

  LoginWithCredentialsPressed(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}
