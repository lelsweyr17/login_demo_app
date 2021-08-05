import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: _appBar(context),
        body: Center(child: Text('Example')),
      ),
    );
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
            onPressed: () {},
            splashRadius: 25));
  }

  PreferredSizeWidget _tabBar() {
    return TabBar(
      tabs: [
        Tab(text: 'On hold'),
        Tab(text: 'In progress'),
        Tab(text: 'Needs review'),
        Tab(text: 'Approved'),
      ],
    );
  }

  PreferredSizeWidget _appBar(context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        _logOutButton(context),
      ],
      bottom: _tabBar(),
    );
  }
}
