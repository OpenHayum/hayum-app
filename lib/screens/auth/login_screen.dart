import 'package:flutter/material.dart';
import 'package:hayum/bloc/auth_bloc.dart';
import 'package:hayum/component/hy_textfield.dart';
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

  @override
  void dispose() {
    authBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: authBloc.loggedInUser,
      builder: (context, AsyncSnapshot<Auth> snapshot) {
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
    const padding = Padding(padding: EdgeInsets.all(10));
    return Scaffold(
        appBar: AppBar(
          title: Text('Hayum'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HayumTextField(labelText: "Email or Mobile No."),
            padding,
            HayumTextField(labelText: "Password", obscureText: true),
            padding,
            RaisedButton(
              child: Padding(child: Text("Login"), padding: EdgeInsets.fromLTRB(40, 20, 40, 20)),
              onPressed: _onLoginButtonPressed,
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
            )
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
