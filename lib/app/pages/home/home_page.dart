import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_demo_app/app/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:login_demo_app/app/bloc/authentication_bloc/authentication_event.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: _appBar(context),
        body: TabBarView(children: [
          _onHold(context),
          _inProgress(context),
          _needsReview(context),
          _approved(context),
        ]),
      ),
    );
  }

  Widget _onHold(context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('on hold'),
            ),
          );
        });
  }

  Widget _inProgress(context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('in progress'),
            ),
          );
        });
  }

  Widget _needsReview(context) {
    return ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('needs review'),
            ),
          );
        });
  }

  Widget _approved(context) {
    return ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('approved'),
            ),
          );
        });
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
