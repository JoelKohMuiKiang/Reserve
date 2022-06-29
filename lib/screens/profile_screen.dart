import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/settings/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Profile',
          style: TextStyle(fontFamily: 'ITCKRIST', fontSize: 30),
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
                      fontFamily: 'ITCKRIST',
                      fontSize: 20,
                    ),
                  ),
                  Text('Name',
                      style: TextStyle(
                          fontFamily: 'ITCKRIST',
                          fontSize: 20,
                          decoration: TextDecoration.underline)),
                ],
              ),
            ),
            Container
            (width: 360,
                child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Koh Mui Kiang Joel',
                  style: TextStyle(
                    fontFamily: 'ITCKRIST',
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
                      fontFamily: 'ITCKRIST',
                      fontSize: 20,
                    ),
                  ),
                  Text('Matrix Number',
                      style: TextStyle(
                          fontFamily: 'ITCKRIST',
                          fontSize: 20,
                          decoration: TextDecoration.underline)),
                ],
              ),
            ),
            Container
              (width: 360,
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '2101670D',
                      style: TextStyle(
                        fontFamily: 'ITCKRIST',
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
                      fontFamily: 'ITCKRIST',
                      fontSize: 20,
                    ),
                  ),
                  Text('Mobile Number',
                      style: TextStyle(
                          fontFamily: 'ITCKRIST',
                          fontSize: 20,
                          decoration: TextDecoration.underline)),
                ],
              ),
            ),
            Container
              (width: 360,
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '90604154',
                      style: TextStyle(
                        fontFamily: 'ITCKRIST',
                        fontSize: 20,
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
