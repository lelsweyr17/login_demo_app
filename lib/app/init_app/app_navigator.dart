import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_demo_app/app/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:login_demo_app/app/bloc/authentication_bloc/authentication_state.dart';
import 'package:login_demo_app/app/pages/home_page.dart';
import 'package:login_demo_app/app/pages/login/login_page.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      return Navigator(
        pages: [
          if (state is Unathenticated) MaterialPage(child: LoginPage()),
          if (state is Authenticated) MaterialPage(child: HomePage()),
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
