import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_demo_app/bloc/login_bloc/login_bloc.dart';
import 'package:login_demo_app/bloc/login_bloc/login_event.dart';
import 'package:login_demo_app/bloc/login_bloc/login_state.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  LoginBloc _loginBloc = LoginBloc();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 1),
              content: Text('Login failure'),
              backgroundColor: Colors.redAccent,
            ),
          );
        } else if (state.isSubmitting) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 1),
            content: Text('Logging in...'),
          ));
        } else if (state.isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Login success'),
              backgroundColor: Colors.greenAccent,
              duration: Duration(seconds: 1)));
          // BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return Form(
          key: _formKey,
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  sampleTextField(
                      _usernameController,
                      state.isUsernameValid,
                      state.isUsernameValid ? null : 'Minimum is 4 characters',
                      false),
                  sampleTextField(
                      _passwordController,
                      state.isPasswordValid,
                      state.isPasswordValid ? null : 'Minimum is 8 characters',
                      true),
                  logInButton(context, state),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget sampleTextField(controller, isValid, errorMessage, obscure) {
    return TextField(
        obscureText: obscure,
        controller: controller,
        textAlign: TextAlign.center,
        cursorColor: Theme.of(context).accentColor,
        decoration: InputDecoration(
          errorText: !isValid ? errorMessage : null,
          focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.height * 0.5),
            borderSide: BorderSide(
                width: 2,
                color: isValid ? Theme.of(context).accentColor : Colors.red),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.height * 0.5),
              borderSide: BorderSide(color: Theme.of(context).accentColor)),
        ));
  }

  Widget logInButton(context, state) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.height * 0.5),
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
}
