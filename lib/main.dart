import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:reserve/screens/booking_page.dart';
import 'package:reserve/screens/color_page.dart';
import 'package:reserve/screens/customization_screen.dart';
import 'package:reserve/screens/feedback_screen.dart';
import 'package:reserve/screens/help_screen.dart';
import 'package:reserve/screens/log_in_page.dart';
import 'package:reserve/screens/my_booking_page.dart';
import 'package:reserve/screens/notification_screen.dart';
import 'package:reserve/screens/photo_gallery_page.dart';
import 'package:reserve/screens/profile_screen.dart';
import 'package:reserve/screens/settings_screen.dart';
import 'package:reserve/screens/text_page.dart';
import 'package:reserve/screens/upcoming_bookings_notification_page.dart';
import 'package:reserve/screens/wallpaper_page.dart';
import 'booking_database.dart';
import 'provider/theme_provider.dart';
import 'screens/edit_booking_page.dart';
import 'screens/text_color_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      home: MainScreen(),
      routes: {
        LogInPage.routeName : (_) {return LogInPage(); },
        BookingPage.routeName : (_) {return BookingPage(); },
        MyBooking.routeName: (_) {return MyBooking(); },
        Settings.routeName : (_) {return Settings();},
        ProfileScreen.routeName: (_) {return ProfileScreen();},
        CustomizationScreen.routeName: (_) {return CustomizationScreen();},
        NotificationScreen.routeName: (_) {return NotificationScreen();},
        HelpScreen.routeName: (_) {return HelpScreen();},
        FeedbackScreen.routeName: (_) {return FeedbackScreen();},
        WallpaperPage.routeName: (_) {return WallpaperPage();},
        TextPage.routeName: (_) {return TextPage();},
        ColorPage.routeName: (_) {return ColorPage();},
        PhotoGalleryPage.routeName: (_) {return PhotoGalleryPage();},
        WallpaperPage.routeName: (_) {return WallpaperPage();},
        TextColorPage.routeName: (_) {return TextColorPage();},
        EditBookingsPage.routeName: (_) {return EditBookingsPage();},
        UpcomingBookingsNotificationPage.routeName: (_) {return UpcomingBookingsNotificationPage();},
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  static String routeName = '/';
  @override
  Widget build(BuildContext context) {
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
      ? ''
      : '';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reserve $text',
          style: TextStyle(fontFamily: 'ITCKRIST', fontSize: 30),
        ),
        actions: [
          IconButton(icon: Icon(Icons.settings, size: 40,),
      onPressed: () =>
          Navigator.of(context).pushNamed(Settings.routeName))
        ],
      ),
      body: Column(
        children: [
          Opacity(
              opacity: 0,
              child: Divider(
                height: 30,
              )),
          Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.account_circle,
                size: 150,
              )),
          Container
          (width: 350,
            child: Text(
            'Welcome Koh Mui Kiang Joel! $text',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'ITCKRIST',
              fontSize: 30,
            ),
          ),),
          TextButton(
            child: Text('Next Time Slot: ${(BookingsData.bookingsData.isNotEmpty)?(BookingsData.bookingsData[0].startofbooking! + ' - ' + BookingsData.bookingsData[0].endofbooking! + ', ' + BookingsData.bookingsData[0].level! + ', ' + BookingsData.bookingsData[0].seatnumber!):'-'}',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: 'ITCKRIST',
                fontSize: 20,
                height: 2.1,
                decoration: TextDecoration.underline),),
            onPressed: () =>
                Navigator.pushNamed(context,MyBooking.routeName),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Column(children: [
              Text(
                'Availablility',
                style: TextStyle(
                  fontFamily: 'ITCKRIST',
                  fontSize: 20,
                  height: 2.5,
                ),
              ),
              OutlinedButton(
                child: Text(
                  'Click Here $text',
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
                  print('Pressed');
                },
              ),
            ]),
            Column(children: [
              Text(
                'Booking of Seats $text',
                style: TextStyle(
                  fontFamily: 'ITCKRIST',
                  fontSize: 20,
                  height: 2.5,
                ),
              ),
              OutlinedButton(
                child: Text(
                  'Click Here $text',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'ITCKRIST',
                    fontSize: 20,
                  ),
                ),
                style: ButtonStyle(
                    side: MaterialStateProperty.all(BorderSide(
                      color: Theme.of(context).primaryColor,
                ))),
                onPressed: () =>
                    Navigator.of(context).pushNamed(BookingPage.routeName),
              ),
            ]),
          ]),
        ],
      ),
    );
  }
}
