
import 'package:flutter/material.dart';
import 'package:xplorandom/ui/plan_details_listview.dart';
import 'package:xplorandom/widgets/gradient_back.dart';
import 'package:xplorandom/widgets/button_green.dart';

class XplorandomInitPage extends StatelessWidget {
  double screenWidth;

  @override
  Widget build(BuildContext context) {
    //Se utiliza la siguiente líe de código para que la apliación se ajuste al ancho de la pnatalla del dispositivo movil
    screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    // TODO: implement build
    return inicioUI();
  }

  Widget inicioUI() {

    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(heigth: null), //El parámetro null lo pone a full screen
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //Esta propiedad centra vertical el texto y el botón
            children: <Widget>[
              //El widget Flexible en la estructura que se muestra a continuación, evita el desbordamiento del texto en la pantalla
              Flexible(
                child: Container(
                  width: screenWidth,
                  child: Text(
                    " Bienvenido \n lo invitamos a \n iniciar la mejor \n experiencia",
                    style: TextStyle(
                        fontSize: 37.0,
                        //fontFamily: 'Lato',
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              //Se implementa el button_green
              ButtonGreen(
                text: "Xplorandom",

                width: 300.0,
                height: 50.0,
              )
            ],
          )
        ],
      ),
    );
  }
}
