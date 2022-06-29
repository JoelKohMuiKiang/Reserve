import 'package:flutter/material.dart';

class ColorPage extends StatelessWidget {
  static String routeName = '/color';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Color',
          style: TextStyle(fontFamily: 'ITCKRIST', fontSize: 30),
        ),
      ),
    );
  }
}
