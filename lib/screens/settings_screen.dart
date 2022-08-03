import 'package:flutter/material.dart';
import 'package:reserve_newest1/widgets/app_drawer.dart';
import 'package:reserve_newest1/widgets/settings_list_view.dart';

class SettingsScreen extends StatelessWidget {
  //route name for the Settings Screen
  static String routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'
        ),
      ),
      body: Container(
        child: SettingsListView(),
      ),
      drawer: AppDrawer(),
    );
  }
}
