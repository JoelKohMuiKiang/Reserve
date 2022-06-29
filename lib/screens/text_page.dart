import 'package:flutter/material.dart';
import 'package:reserve/screens/text_color_page.dart';

class TextPage extends StatelessWidget {
  static String routeName = '/text';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Text',
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
                width: 370,
                child: Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                      child: Text(
                        'Color',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontFamily: 'ITCKRIST',
                            fontSize: 20),
                      ),
                      onPressed: () =>
                          Navigator.of(context).pushNamed(TextColorPage.routeName),
                    ))),
            Divider(
              height: 20,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ));
  }
}
