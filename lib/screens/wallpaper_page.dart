import 'package:flutter/material.dart';
import 'package:reserve/screens/color_page.dart';
import 'package:reserve/screens/photo_gallery_page.dart';

class WallpaperPage extends StatelessWidget {
  static String routeName = '/wallpaper';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(
        'Wallpaper',
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
              child: TextButton
                (child: Text('Color',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'ITCKRIST',
                    fontSize: 20),),
                onPressed: () =>
                    Navigator.of(context).pushNamed(ColorPage.routeName),)
          )
      ),
      Divider(
        height: 20,
        color: Theme.of(context).primaryColor,
      ),
      Container(
          width: 370,
          child: Align(
              alignment: Alignment.topLeft,
              child: TextButton
                (child: Text('Photo Gallery',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'ITCKRIST',
                    fontSize: 20),),
                onPressed: () =>
                    Navigator.of(context).pushNamed(PhotoGalleryPage.routeName),
              ))
      ),
          Divider(
            height: 20,
            color: Theme.of(context).primaryColor,
          ),
      ],
      )
    );
  }
}
