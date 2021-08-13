part of "login_page.dart";

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  LoginBloc _loginBloc = LoginBloc();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isFailure) {
          _notificationSnackBar(context, state.error, Colors.redAccent);
        } else if (state.isSubmitting) {
          _notificationSnackBar(context, 'Logging in...', Colors.white);
        } else if (state.isSuccess) {
          _notificationSnackBar(context, 'Login success', Colors.greenAccent);
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        final double screenHeight = MediaQuery.of(context).size.height;
        final double loginHeight =
            (screenHeight * 0.3 > 220) ? screenHeight * 0.3 : 220;
        final double loginWidth = MediaQuery.of(context).size.width * 0.8;
        final String usernameErrorMessage = 'Minimum is 4 characters';
        final String passwordErrorMessage = 'Minimum is 8 characters';
        return Center(
          child: Container(
            height: loginHeight,
            width: loginWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SampleTextField(
                  _usernameController,
                  state.isUsernameValid,
                  state.isUsernameValid ? null : usernameErrorMessage,
                  false,
                ),
                SampleTextField(
                  _passwordController,
                  state.isPasswordValid,
                  state.isPasswordValid ? null : passwordErrorMessage,
                  true,
                ),
                SizedBox(),
                LogInButton(
                  context,
                  state,
                  _loginBloc,
                  _usernameController,
                  _passwordController,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      _notificationSnackBar(context, message, color) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: Duration(milliseconds: 500)));
  }

  bool get isNotEmpty =>
      _usernameController.text.isNotEmpty &&
      _passwordController.text.isNotEmpty;

  void _usernameChanged() {
    _loginBloc.add(LoginUsernameChange(_usernameController.text));
  }

  void _passwordChanged() {
    _loginBloc.add(LoginPasswordChange(_passwordController.text));
  }

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _usernameController.addListener(_usernameChanged);
    _passwordController.addListener(_passwordChanged);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
