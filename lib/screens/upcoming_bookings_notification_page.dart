import 'package:flutter/material.dart';

class UpcomingBookingsNotificationPage extends StatefulWidget {
  static String routeName = '/login';
  bool value = false;

  @override
  State<UpcomingBookingsNotificationPage> createState() => _UpcomingBookingsNotificationPageState();
}

class _UpcomingBookingsNotificationPageState extends State<UpcomingBookingsNotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Upcoming Booking',
          style: TextStyle(fontFamily: 'ITCKRIST', fontSize: 30),
        ),
      ),
      body: Column(
        children: [
          Container
            (alignment: Alignment.center,
            child: Text(
              'Notification',
              style: TextStyle(fontFamily: 'ITCKRIST', fontSize: 30),
            ),
          )
        ],
      ),
    );
  }
}
