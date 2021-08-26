import 'package:flutter/material.dart';
import 'dart:io';
import './main.dart';
import 'place.dart';
import 'place_dialog.dart';
import 'dbhelper.dart';

class PictureScreen extends StatelessWidget {
  final String imagePath;
  final Place place;

  PictureScreen(this.imagePath, this.place);

  @override
  Widget build(BuildContext context) {
    DbHelper helper = DbHelper();
    return Scaffold(
        appBar: AppBar(
          title: Text('Save Picture'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                place.image = imagePath;
                //save image
                helper.insertPlace(place);
                MaterialPageRoute route = MaterialPageRoute(
                    builder: (context) => MainMap());
                Navigator.push(context, route);
              },

            )
          ],
        ),
        body: Container(
          child: Image.file(File(imagePath)),
        )
    );
  }
}