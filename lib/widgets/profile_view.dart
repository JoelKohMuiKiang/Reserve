import 'package:flutter/material.dart';
import 'package:reserve_newest1/models/user_data.dart';
import 'package:reserve_newest1/services/user_services.dart';

class ProfileView extends StatelessWidget {

  UserServices databaseServices = UserServices(uid: 'uid');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Users>(
      stream: databaseServices.getUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(child: CircularProgressIndicator());
        else {
            return Container(
              child: Column(
                children: [
                  Opacity(
                      opacity: 0,
                      child: Divider(
                        height: 10,
                      )),
                  Container(
                    width: 370,
                    child: Row(
                      children: [
                        Icon(
                          Icons.account_circle,
                          size: 40,
                        ),
                        Text(
                          '  ',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text('Name',
                            style: TextStyle(
                                fontSize: 20,
                                decoration: TextDecoration.underline)),
                      ],
                    ),
                  ),
                  Container(
                      width: 360,
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            snapshot.data!.name,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ))),
                  Opacity(
                      opacity: 0,
                      child: Divider(
                        height: 10,
                      )),
                  Container(
                    width: 370,
                    child: Row(
                      children: [
                        Icon(
                          Icons.credit_card,
                          size: 40,
                        ),
                        Text(
                          '  ',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text('Matrix Number',
                            style: TextStyle(
                                fontSize: 20,
                                decoration: TextDecoration.underline)),
                      ],
                    ),
                  ),
                  Container(
                      width: 360,
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            snapshot.data!.matrixNumber,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ))),
                  Opacity(
                      opacity: 0,
                      child: Divider(
                        height: 10,
                      )),
                  Container(
                    width: 370,
                    child: Row(
                      children: [
                        Icon(
                          Icons.phone,
                          size: 40,
                        ),
                        Text(
                          '  ',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text('Mobile Number',
                            style: TextStyle(
                                fontSize: 20,
                                decoration: TextDecoration.underline)),
                      ],
                    ),
                  ),
                  Container(
                      width: 360,
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            snapshot.data!.mobileNumber.toString(),
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ))),
                ],
              ),
            );
          }
        }
    );
  }
}
