import 'package:flutter/material.dart';

import 'blue_botton.dart';

class CovidImage extends StatelessWidget{
  String image='assets/img/cuidado_1.jpg';
  @override
  Widget build(BuildContext context) {
     final imageCentral= Container(
      height:350.0,
      width: 350.0,
      margin: EdgeInsets.only(
        top:150.0,
        bottom: 15.0,
        left: 15.0,
        right: 15.0,
        ),
      decoration:BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image:AssetImage(image)
        ),
        //borderRadius: BorderRadius.all(Radius.circular(8.0)),
        shape:BoxShape.circle,
      )
    );

     return Stack(
       alignment: Alignment(0.5,0.9),
       children:<Widget>[
         imageCentral,
         BlueBotton()
       ]
     );

  }
}