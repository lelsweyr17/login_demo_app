abstract class AuthenticationState {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class Unknown extends AuthenticationState {}

class Authenticated extends AuthenticationState {}

class Unathenticated extends AuthenticationState {}
