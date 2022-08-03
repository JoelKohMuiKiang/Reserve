import 'package:flutter/material.dart';
import 'package:reserve_newest1/services/auth_services.dart';
import 'package:reserve_newest1/widgets/login_form.dart';
import 'package:reserve_newest1/widgets/register_form.dart';

import '../services/auth_services.dart';

class AuthScreen extends StatefulWidget {
  static String routeName = '/auth';

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthService authService = AuthService();

  bool loginScreen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Reserve'),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              loginScreen ? LoginForm() : RegisterForm(),
              SizedBox(height: 5),
              loginScreen ? TextButton(onPressed: () {
                setState(() {
                  loginScreen = false;
                });
              }, child: Text('No account? Sign up here!')) :
              TextButton(onPressed: () {
                setState(() {
                  loginScreen = true;
                });
              }, child: Text('Exisiting user? Login in here!')),
              // loginScreen ? TextButton(onPressed: () {
              //   Navigator.of(context).pushNamed(ResetPasswordScreen.routeName);
              // }, child: Text('Forgotten Password')) : Center()
            ],
          )
      ),
    );
  }
}
