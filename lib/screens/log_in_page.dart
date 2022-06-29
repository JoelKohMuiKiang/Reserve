import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  static String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reserve',
          style: TextStyle(fontFamily: 'ITCKRIST', fontSize: 30),
        ),
      ),
    );
  }
}
