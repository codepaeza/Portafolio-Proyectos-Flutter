import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CovidIcon extends StatelessWidget{
  String pathImage='assets/img/covid_img.jpg';
  String comment='La distancia social es prevención';

  CovidIcon(this.pathImage, this.comment);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final covidComment=Container(
      margin: EdgeInsets.only(
        top: 550.0,
        left: 10.0,
      ),
      child:Text(
        comment,
        textAlign: TextAlign.left,
        style:TextStyle(
          fontSize: 13.0,
          fontFamily: 'ComicNeue',
          fontWeight: FontWeight.w900,
          color: Colors.greenAccent,
        )
      ),
    );

    final photo=Container(
      margin: EdgeInsets.only(
        top:550.0,
        left:10.0,
      ),
      width: 100.0,
      height: 100.0,
      decoration:BoxDecoration(
        shape: BoxShape.circle,
        image:DecorationImage(
          fit:BoxFit.cover,
          image:AssetImage(pathImage)
        )
      )
    );
    return Row(
      children: <Widget>[
        photo,
        covidComment,

      ],
    );
  }

}