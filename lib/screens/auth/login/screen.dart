import 'package:flutter/material.dart';
import 'package:base_app/viewmodel.dart';
import './viewmodel.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return new ScopedModel<LoginViewModel>(
      model: new LoginViewModel(),
      child: new Container(
        child: new Column(
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}

