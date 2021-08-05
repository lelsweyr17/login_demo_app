import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kanban'),
        centerTitle: false,
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              usernameTextField(context),
              passwordTextField(context),
              logInButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget logInButton(context) {
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
          onPressed: () {},
        ));
  }

  Widget usernameTextField(context) {
    return TextField(
      textAlign: TextAlign.center,
      cursorColor: Theme.of(context).accentColor,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.height * 0.5),
          borderSide:
              BorderSide(width: 2, color: Theme.of(context).accentColor),
        ),
        border: new OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.height * 0.5),
            borderSide: new BorderSide(color: Theme.of(context).accentColor)),
      ),
    );
  }

  Widget passwordTextField(context) {
    return TextField(
      obscureText: true,
      textAlign: TextAlign.center,
      cursorColor: Theme.of(context).accentColor,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.height * 0.5),
          borderSide:
              BorderSide(width: 2, color: Theme.of(context).accentColor),
        ),
        border: new OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.height * 0.5),
            borderSide: new BorderSide(color: Theme.of(context).accentColor)),
      ),
    );
  }
}
