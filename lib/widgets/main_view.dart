import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:reserve_newest1/models/user_data.dart';
import 'package:reserve_newest1/services/auth_services.dart';
import 'package:reserve_newest1/services/firestore_services.dart';
import 'package:reserve_newest1/services/user_services.dart';

class MainScreenView extends StatefulWidget {
  @override
  State<MainScreenView> createState() => _MainScreenViewState();
}

class _MainScreenViewState extends State<MainScreenView> {
  FireStoreServices fsServices = FireStoreServices();
  UserServices databaseServices = UserServices(uid: 'uid');
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
      return StreamBuilder<Users>(
        stream: databaseServices.getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          else {
            {
              return Column(
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
                  Container(
                      width: 350,
                      child: Text(
                        'Welcome ' + snapshot.data!.name + '!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      )),
                ],
              );
            }
          }
        });
  }
}
