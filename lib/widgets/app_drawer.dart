//horizontal navigation bar widget for tidiness

import 'package:flutter/material.dart';
import 'package:reserve_newest1/main.dart';
import 'package:reserve_newest1/screens/bookings_list_screen.dart';
import 'package:reserve_newest1/screens/settings_screen.dart';
import 'package:reserve_newest1/services/auth_services.dart';

class AppDrawer extends StatelessWidget {


  @override
    Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          title: Text("Hello Friend!"),
          automaticallyImplyLeading: false,
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(MainScreen.routeName),
        ),
        Divider(height: 3, color: Colors.blueGrey),
        ListTile(
          leading: Icon(Icons.access_alarm),
          title: Text('My Bookings'),
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(BookingsListScreen.routeName),
        ),
        Divider(height: 3, color: Colors.blueGrey),
        ListTile(
          leading: Icon(Icons.access_alarm),
          title: Text('Settings'),
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(SettingsScreen.routeName),
        ),
        Divider(height: 3, color: Colors.blueGrey)
      ]),
    );
  }
}
