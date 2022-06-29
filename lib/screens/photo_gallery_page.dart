import 'package:flutter/material.dart';

class PhotoGalleryPage extends StatelessWidget {
  static String routeName = '/photogallery';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Photo Gallery',
          style: TextStyle(fontFamily: 'ITCKRIST', fontSize: 30),
        ),
      ),
    );
  }
}
