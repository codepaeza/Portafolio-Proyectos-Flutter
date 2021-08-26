import 'package:flutter/material.dart';


class GradientBack extends StatelessWidget {


  String title = "Xplorandom";
  //El gradient_back. dart se utilizará como fondo del screen de login (sign_in_screen.dart), por lo que se harán variables parámetros, se incluye:
  double heigth=0.0;

  //Por lo tanto el método constructor se modifica incluyendo heigth
  GradientBack({Key key, this.heigth});//En caso que heigth sea null, se tomará la medida de la pantalla completa (fullscreen)

  @override
  Widget build(BuildContext context) {

    double screenHeight= MediaQuery.of(context).size.height; //MediaQuery permite la altura de pantalla de cualquier celular
    double screenWidth= MediaQuery.of(context).size.width;

    if(heigth==null){
      heigth=screenHeight; //screenHeight es el fullscreen
    }

    // TODO: implement build
    return Container(
      width: screenWidth,
      //El valor que tenía inicialente era 250.0, al hacerlo variable toma el nombre e la misma variable
      height: heigth,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xFF4268D3),
                Color(0xFF584CD1)
              ],
              begin: FractionalOffset(0.2, 0.0),//(0.2, 0.0)
              end: FractionalOffset(1.0, 0.6), //(1.0, 0.6)
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp
          )
      ),


      child:FittedBox(
          fit: BoxFit.none,
          alignment:Alignment(-1.5,-0.8),//(-1.5,-0.8)
          child: Container(
            width: screenHeight,//Al poner screenHeight en la propiedad width, se consigue el efecto de circunferencia centrada al borde derecho de la pantalla
            height: screenHeight,
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.1),//(0,0,0,0.5)
              borderRadius: BorderRadius.circular(screenHeight/2),
            ),
          )
      )

      /*Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontFamily: "Lato",
          fontWeight: FontWeight.bold
        ),
      )*/,

      //alignment: Alignment(-0.9, -0.6),

    );
  }

}