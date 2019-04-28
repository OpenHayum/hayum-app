import 'package:flutter/material.dart';
import 'package:hayum/bloc/auth_bloc.dart';
import 'package:hayum/models/auth_model.dart';
import 'package:hayum/screens/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _identifier;
  String _password;
  bool _hasPressedButton = false;

//  @override
//  void dispose() {
//    authBloc.dispose();
//    super.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: authBloc.loggedInUser,
      builder: (context, AsyncSnapshot<Auth> snapshot) {
        print(snapshot.data);
        if (snapshot.hasData) {
          return HomeScreen(title: "Home", auth: snapshot.data);
        }
        if (_hasPressedButton) {
          return Center(child: CircularProgressIndicator());
        }
        return buildLoginForm();
      },
    );
  }

  Widget buildLoginForm() {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hayum'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
                decoration: InputDecoration(hintText: "Email/Mobile"),
                onChanged: (text) => {_identifier = text}),
            TextField(
                decoration: InputDecoration(hintText: "Password"),
                obscureText: true,
                onChanged: (text) => {_password = text}),
            FlatButton.icon(
                onPressed: _onLoginButtonPressed, icon: Icon(Icons.email), label: Text("Login"))
          ],
        ));
  }

  void _onLoginButtonPressed() {
    Map<String, String> data = {"Identifier": _identifier, "Password": _password};
    authBloc.loginUser(data);
    setState(() {
      _hasPressedButton = true;
    });
  }
}
