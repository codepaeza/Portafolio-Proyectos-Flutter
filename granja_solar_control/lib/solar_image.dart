import 'package:flutter/material.dart';



class SolarImage extends StatelessWidget {
  String image = 'assets/images/solar-2796471_1920.jpg';

  SolarImage(this.image);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final cuadro = Container(
      height: 390.0,
      width: 360.0,
      margin: EdgeInsets.only(
          top: 260.0,
          left: 2.0
      ),

      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(image)
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0)
            )
          ]
      ),
    );
    return Stack(
      alignment: Alignment(0.1,0.1),
      children: <Widget>[
        cuadro,

      ],
    );
  }
}