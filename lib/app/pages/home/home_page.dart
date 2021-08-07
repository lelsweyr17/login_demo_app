import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_demo_app/app/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:login_demo_app/app/bloc/authentication_bloc/authentication_event.dart';
import 'package:login_demo_app/app/bloc/user_data_bloc.dart/user_data_bloc.dart';
part "home_tab_bar_view.dart";

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: _appBar(context),
        body: BlocProvider<UserDataBloc>(
          create: (context) => UserDataBloc(),
          child: HomeTabBarView(),
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar(context) {
    return AppBar(
        automaticallyImplyLeading: false,
        actions: [
          _logOutButton(context),
        ],
        bottom: TabBar(
          isScrollable: true,
          tabs: [
            Tab(text: 'On hold'),
            Tab(text: 'In progress'),
            Tab(text: 'Needs review'),
            Tab(text: 'Approved'),
          ],
        ));
  }

  Widget _logOutButton(context) {
    return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).accentColor,
        ),
        child: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            },
            splashRadius: 25));
  }
}
