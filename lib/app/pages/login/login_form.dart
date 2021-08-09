part of "login_page.dart";

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  LoginBloc _loginBloc = LoginBloc();

  final _formKey = GlobalKey<FormState>();

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
        final double loginHeight =
            (MediaQuery.of(context).size.height * 0.3 > 200)
                ? MediaQuery.of(context).size.height * 0.3
                : 200;
        final double loginWidth = MediaQuery.of(context).size.width * 0.8;
        final String usernameErrorMessage = 'Minimum is 4 characters';
        final String passwordErrorMessage = 'Minimum is 8 characters';
        return Form(
          key: _formKey,
          child: Center(
            child: Container(
              height: loginHeight,
              width: loginWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  sampleTextField(
                      _usernameController,
                      state.isUsernameValid,
                      state.isUsernameValid ? null : usernameErrorMessage,
                      false),
                  sampleTextField(
                      _passwordController,
                      state.isPasswordValid,
                      state.isPasswordValid ? null : passwordErrorMessage,
                      true),
                  SizedBox(),
                  logInButton(context, state),
                ],
              ),
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

  Widget sampleTextField(controller, isValid, errorMessage, obscure) {
    final String hintUsernameText = 'Enter your username';
    final String hintPasswordText = 'Enter your password';
    final double borderRadius = MediaQuery.of(context).size.height * 0.5;
    return TextField(
        obscureText: obscure,
        controller: controller,
        textAlign: TextAlign.center,
        cursorColor: Theme.of(context).accentColor,
        decoration: InputDecoration(
          errorText: !isValid ? errorMessage : null,
          hintText: obscure ? hintPasswordText : hintUsernameText,
          focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
                width: 2,
                color: isValid ? Theme.of(context).accentColor : Colors.red),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  borderRadius),
              borderSide: BorderSide(color: Theme.of(context).accentColor)),
        ));
  }

  Widget logInButton(context, state) {
    final double borderRadius = MediaQuery.of(context).size.height * 0.5;
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(borderRadius),
          color: Theme.of(context).accentColor,
        ),
        child: TextButton(
          child: Text('Log in',
              style: TextStyle(color: Theme.of(context).primaryColor)),
          onPressed: () {
            if (isLoginButtonEnabled(state)) {
              _onFormSubmitted();
            }
          },
        ));
  }

  bool get isNotEmpty =>
      _usernameController.text.isNotEmpty &&
      _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) {
    return state.isFormValid && isNotEmpty && !state.isSubmitting;
  }

  void _usernameChanged() {
    _loginBloc.add(LoginUsernameChange(_usernameController.text));
  }

  void _passwordChanged() {
    _loginBloc.add(LoginPasswordChange(_passwordController.text));
  }

  void _onFormSubmitted() {
    _loginBloc.add(LoginWithCredentialsPressed(
        _usernameController.text, _passwordController.text));
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
