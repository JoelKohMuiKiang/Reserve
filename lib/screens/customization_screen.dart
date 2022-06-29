import 'package:flutter/material.dart';
import 'package:reserve/screens/text_page.dart';
import 'package:reserve/screens/wallpaper_page.dart';

class CustomizationScreen extends StatelessWidget {
  static String routeName = '/customization';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Customization',
            style: TextStyle(fontFamily: 'ITCKRIST', fontSize: 30),
          ),
        ),
        body: Column(children: [
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
                      'Wallpaper',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'ITCKRIST',
                          fontSize: 20),
                    ),
                    onPressed: () => Navigator.of(context)
                        .pushNamed(WallpaperPage.routeName),
                  ))),
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
                      'Text',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'ITCKRIST',
                          fontSize: 20),
                    ),
                    onPressed: () =>
                        Navigator.of(context).pushNamed(TextPage.routeName),
                  ))),
          Divider(
            height: 20,
            color: Theme.of(context).primaryColor,
          ),
        ]));
  }
}
