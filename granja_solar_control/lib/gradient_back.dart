import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget{
  String title="Control Granjas Solares";
  GradientBack(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 220.0,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors:[
                Color(0xFF4BC42D),
                Color(0xFFe5e5e5)
              ],
              begin: FractionalOffset(0.05, 0.05),
              end: FractionalOffset(1.8, 1.8),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp

          )
      ),

      child: Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontSize: 40.0,
            fontWeight: FontWeight.bold
        ),
      ),
      alignment: Alignment(-0.9,-0.6),
    );
  }

}