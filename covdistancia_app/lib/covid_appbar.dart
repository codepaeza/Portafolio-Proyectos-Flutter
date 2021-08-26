import 'package:flutter/material.dart';

class CovidAppBar extends StatelessWidget{
  String title="Cov-Distancia";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height:700.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:[
            Color(0xFF03396c),
            Color(0xFF32328d)

        ],
         begin: FractionalOffset(0.5,0.2),
         end: FractionalOffset(0.2,0.8),
         stops: [0.0,0.6],
         tileMode: TileMode.clamp
    )
    ),

    child: Text(
    title,
    style: TextStyle(
    color: Colors.greenAccent,
    fontSize: 30.0,
    fontFamily: 'ComicNeue',
    fontWeight: FontWeight.bold
    ),
    ),
      alignment: Alignment(-0.25,-0.8),
       );

  }

}