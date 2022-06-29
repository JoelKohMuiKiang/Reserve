import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  static String routeName = '/help';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Help',
          style: TextStyle(fontFamily: 'ITCKRIST', fontSize: 30),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Opacity(
                opacity: 0,
                child: Divider(
                  height: 20,
                )),
            Container(
              child: Text('Frequent Questions Asked',
                  style: TextStyle(
                      fontFamily: 'ITCKRIST',
                      fontSize: 23,
                      decoration: TextDecoration.underline)),
            ),
            Opacity(
                opacity: 0,
                child: Divider(
                  height: 20,
                )),
            Container(
              width: 370,
              child: Align(
                child: Text(
                  'Question: Where do I find my bookings? : ',
                  style: TextStyle(
                      fontFamily: 'ITCKRIST',
                      fontSize: 20,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
            Opacity(
                opacity: 0,
                child: Divider(
                  height: 10,
                )),
            Container(
              width: 370,
              child: Align(
                child: Text(
                  'Answer: By clicking on "Next Time Slot", you will be able to read, update and delete your bookings.',
                  style: TextStyle(
                      fontFamily: 'ITCKRIST',
                      fontSize: 20,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
