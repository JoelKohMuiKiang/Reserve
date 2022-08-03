import 'package:flutter/material.dart';
import 'package:reserve_newest1/screens/auth_screen.dart';
import 'package:reserve_newest1/screens/customization_screen.dart';
import 'package:reserve_newest1/screens/feedback_screen.dart';
import 'package:reserve_newest1/screens/help_screen.dart';
import 'package:reserve_newest1/screens/notification_screen.dart';
import 'package:reserve_newest1/screens/profile_screen.dart';
import 'package:reserve_newest1/services/auth_services.dart';

class SettingsListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();

    logout() {
      return authService.logout().then((value) {
        FocusScope.of(context).unfocus();
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Logout successfully!') ,));
        Navigator.of(context).pushNamedAndRemoveUntil(AuthScreen.routeName, (route) => false);
      }
      ).catchError((error) {
        FocusScope.of(context).unfocus();
        String message = error.toString();
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
        Text(message),));
      });
    }

    return Container(
        child: Column(
          children: [
            Opacity(opacity: 0,
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
                      fontSize: 25,
                      height: 2,
                      decoration: TextDecoration.underline
                  ),),
              )
            ),
            Column(
              children: [
                Container(
                    width: 370,
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          child: Text('Your Profile',
                          style: TextStyle(
                              fontSize: 20),),
                          onPressed: () =>
                              Navigator.of(context).pushNamed(ProfileScreen.routeName),)
                    )
                ),
                Divider(
                  height: 20,
                ),
                Container(
                    width: 370,
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          child: Text('Customization',
                            style: TextStyle(
                                fontSize: 20),),
                          onPressed: () =>
                              Navigator.of(context).pushNamed(CustomizationScreen.routeName),)
                    )
                ),
                Divider(
                  height: 20,
                ),
                Container(
                    width: 370,
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          child: Text('Notfication',
                            style: TextStyle(
                                fontSize: 20),),
                          onPressed: () =>
                              Navigator.of(context).pushNamed(NotificationScreen.routeName),)
                    )
                ),
                Divider(
                  height: 20,
                ),
                Opacity(opacity: 0,
                child: Divider(
                  height: 30,
                )),
                Container(
                    width: 350,
                    height: 60,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text('Help and Feedback',
                        style: TextStyle(
                            fontSize: 25,
                            height: 2,
                            decoration: TextDecoration.underline
                        ),),
                    )
                ),
                Container(
                    width: 370,
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          child: Text('Help',
                            style: TextStyle(
                                fontSize: 20),),
                          onPressed: () =>
                              Navigator.of(context).pushNamed(HelpScreen.routeName),)
                    )
                ),
                Divider(
                  height: 20,
                ),
                Container(
                    width: 370,
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          child: Text('Feedback',
                            style: TextStyle(
                                fontSize: 20),),
                          onPressed: () =>
                              Navigator.of(context).pushNamed(FeedbackScreen.routeName),)
                    )
                ),
                Divider(
                  height: 20,
                ),
                OutlinedButton(onPressed: ()=> logout(), child: Text('Logout'))
              ],
            )
          ],
        ),
    );
  }
}
