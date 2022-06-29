import 'package:flutter/material.dart';
import 'package:reserve/screens/customization_screen.dart';
import 'package:reserve/screens/feedback_screen.dart';
import 'package:reserve/screens/help_screen.dart';
import 'package:reserve/screens/log_in_page.dart';
import 'package:reserve/screens/log_in_screen.dart';
import 'package:reserve/screens/notification_screen.dart';
import 'package:reserve/screens/profile_screen.dart';

class Settings extends StatelessWidget {
  static String routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',
          style: TextStyle(
          fontFamily: 'ITCKRIST',
          fontSize: 30,),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Opacity(
                opacity: 0,
                child: Divider(
                  height: 10,
                )),
            Container(
              width: 350,
              height: 60,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Account',
                    style: TextStyle(
                    fontFamily: 'ITCKRIST',
                    fontSize: 25,
                    height: 2,
                    decoration: TextDecoration.underline)),
              ),
            ),
            Opacity(opacity: 0,
                child: Divider(
                  height: 10,
                )),
            Column(
              children: [
                Container(
                    width: 370,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: TextButton
                      (child: Text('Your Profile',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontFamily: 'ITCKRIST',
                            fontSize: 20),),
                        onPressed: () =>
                            Navigator.of(context).pushNamed(ProfileScreen.routeName),)
                    )
                ),
                Divider(
                  height: 20,
                  color: Theme.of(context).primaryColor,
                ),
                Container(
                    width: 370,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: TextButton
                      (child: Text('Customization',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontFamily: 'ITCKRIST',
                            fontSize: 20),),
                        onPressed: () =>
                            Navigator.of(context).pushNamed(CustomizationScreen.routeName),
                    ))
                ),
                Divider(
                  height: 20,
                  color: Theme.of(context).primaryColor,
                ),
                Container(
                    width: 370,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: TextButton
                      (child: Text('Notification',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontFamily: 'ITCKRIST',
                            fontSize: 20),),
                        onPressed: () =>
                            Navigator.of(context).pushNamed(NotificationScreen.routeName),
                    ),)
                ),
                Divider(
                  height: 20,
                  color: Theme.of(context).primaryColor,
                ),
                Opacity(opacity: 0,
                child: Divider(
                  height: 30,
                )),
                Container(
                  width: 350,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Help and Feedback',
                      style: TextStyle(
                          fontFamily: 'ITCKRIST',
                          fontSize: 25,
                      decoration: TextDecoration.underline),),
                  ),
                ),
                Opacity(opacity: 0,
                    child: Divider(
                      height: 10,
                    )),
                Container(
                  width: 370,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: TextButton
                    (child: Text('Help',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'ITCKRIST',
                          fontSize: 20),),
                      onPressed: () =>
                          Navigator.of(context).pushNamed(HelpScreen.routeName),
                  ),)
                ),
                Divider(
                  height: 20,
                  color: Theme.of(context).primaryColor,
                ),
                Container(
                  width: 370,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: TextButton
                    (child: Text('Feedback',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'ITCKRIST',
                          fontSize: 20),),
                      onPressed: () =>
                          Navigator.of(context).pushNamed(FeedbackScreen.routeName),)
                  ),
                ),
                Divider(
                  height: 20,
                  color: Theme.of(context).primaryColor,
                ),
                OutlinedButton(
                  child: Text(
                    'Log Out',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'ITCKRIST',
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                    ),
                  ),
                  style: ButtonStyle(
                      side: MaterialStateProperty.all(BorderSide(
                        color: Theme.of(context).primaryColor,
                      ))),
                  onPressed: () {
                    Navigator.of(context).pushNamed(LogInPage.routeName);
                  }
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
