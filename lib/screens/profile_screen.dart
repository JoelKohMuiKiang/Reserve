import 'package:flutter/material.dart';
import 'package:reserve_newest1/widgets/profile_view.dart';

class ProfileScreen extends StatelessWidget {
  //route name for the Profile Screen
  static String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Profile',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Container(
        child: ProfileView(),
      ),
    );
  }
}
