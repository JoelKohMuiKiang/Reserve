import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reserve_newest1/models/bookings.dart';
import 'package:reserve_newest1/screens/add_bookings_screen.dart';
import 'package:reserve_newest1/screens/add_user_info_screen.dart';
import 'package:reserve_newest1/screens/auth_screen.dart';
import 'package:reserve_newest1/screens/bookings_list_screen.dart';
import 'package:reserve_newest1/screens/customization_screen.dart';
import 'package:reserve_newest1/screens/edit_bookings_screen.dart';
import 'package:reserve_newest1/screens/feedback_screen.dart';
import 'package:reserve_newest1/screens/help_screen.dart';
import 'package:reserve_newest1/screens/notification_screen.dart';
import 'package:reserve_newest1/screens/profile_screen.dart';
import 'package:reserve_newest1/screens/settings_screen.dart';
import 'package:reserve_newest1/services/auth_services.dart';
import 'package:reserve_newest1/services/firestore_services.dart';
import 'package:reserve_newest1/services/user_services.dart';
import 'package:reserve_newest1/widgets/app_drawer.dart';
import 'package:reserve_newest1/widgets/bookings_list.dart';
import 'package:reserve_newest1/widgets/main_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //declaring and initializing an AuthService
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) => snapshot.connectionState == ConnectionState.waiting? Center(child: CircularProgressIndicator()) :
      StreamBuilder<User?>(
        stream: authService.getAuthUser(),
        builder: (context, snapshot) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: snapshot.connectionState == ConnectionState.waiting?
              Center(child: CircularProgressIndicator()) :
              snapshot.hasData? MainScreen(): AuthScreen(),

            //to include the route property in MaterialApp
            routes: {
              AddBookingsScreen.routeName : (_) { return AddBookingsScreen(); },
              BookingsListScreen.routeName : (_) { return BookingsListScreen(); },
              EditBookingsScreen.routeName: (_) { return EditBookingsScreen(); },
              AuthScreen.routeName: (_) { return AuthScreen(); },
              SettingsScreen.routeName: (_) { return SettingsScreen(); },
              ProfileScreen.routeName: (_) { return ProfileScreen(); },
              CustomizationScreen.routeName: (_) { return CustomizationScreen(); },
              NotificationScreen.routeName: (_) { return NotificationScreen(); },
              HelpScreen.routeName: (_) { return HelpScreen(); },
              FeedbackScreen.routeName: (_) { return FeedbackScreen(); },
              AddUserInfoScreen.routeName: (_) {return AddUserInfoScreen(); }
          });
        }
      )
    );
  }
}

class MainScreen extends StatefulWidget {
  //route name for the Main Screen
  static String routeName = '/';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {

      return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text('Reserve'),
          ),
          body: MainScreenView(),
          drawer: AppDrawer(),
      );
  }
}
