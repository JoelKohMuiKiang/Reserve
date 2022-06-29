import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  static String routeName = '/feedback';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feedback',
          style: TextStyle(fontFamily: 'ITCKRIST', fontSize: 30),
        ),
      ),
    );
  }
}
