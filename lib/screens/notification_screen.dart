import 'package:flutter/material.dart';
import 'package:reserve/screens/upcoming_bookings_notification_page.dart';

class NotificationScreen extends StatelessWidget {
  static String routeName = '/notification';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification',
          style: TextStyle(fontFamily: 'ITCKRIST', fontSize: 30),
        ),
      ),
      body: Column(
        children: [
          Opacity(
              opacity: 0,
              child: Divider(
                height: 10,
              )),
          Container(
              width: 350,
              child: Row(
                children: [
                  Text(
                    'Notify Next Booking',
                    style: TextStyle(
                      fontFamily: 'ITCKRIST',
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  SwitchScreen()
                ],
              )),
          Divider(
            height: 20,
            color: Theme.of(context).primaryColor,
          ),
          Container(
              width: 370,
              child: Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    child: Text(
                      'Upcoming Booking Notification',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'ITCKRIST',
                          fontSize: 20),
                    ),
                    onPressed: () =>
                        Navigator.of(context).pushNamed(UpcomingBookingsNotificationPage.routeName),
                  ))),
          Divider(
            height: 20,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}

class SwitchScreen extends StatefulWidget {
  @override
  SwitchClass createState() => new SwitchClass();
}

class SwitchClass extends State {
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      Transform.scale(
          scale: 1,
          child: Switch(
            onChanged: toggleSwitch,
            value: isSwitched,
            activeColor: Colors.white,
            activeTrackColor: Colors.lightBlue,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey,
          )),
    ]);
  }
}
