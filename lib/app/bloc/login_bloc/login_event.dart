abstract class LoginEvent {}

class LoginUsernameChange extends LoginEvent {
  final String username;

  LoginUsernameChange(this.username);
}

class LoginPasswordChange extends LoginEvent {
  final String password;

  LoginPasswordChange(this.password);
}

class LoginWithCredentialsPressed extends LoginEvent {
  final String username;
  final String password;
  final int error;

  LoginWithCredentialsPressed(this.username, this.password, {this.error = 200});
}
