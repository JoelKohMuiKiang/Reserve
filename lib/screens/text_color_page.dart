import 'package:flutter/material.dart';

class TextColorPage extends StatelessWidget {
  static String routeName = '/textcolor';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Text Color',
          style: TextStyle(fontFamily: 'ITCKRIST', fontSize: 30),
        ),
      ),
    );
  }
}
