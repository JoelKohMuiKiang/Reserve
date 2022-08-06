import 'package:flutter/material.dart';

class CustomizationScreen extends StatelessWidget {
  //route name for the Customization Screen
  static String routeName = '/customization';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Customization',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Container()
    );
  }
}
