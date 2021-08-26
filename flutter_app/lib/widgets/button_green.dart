import 'package:flutter/material.dart';

class ButtonGreen extends StatefulWidget{
  //Se crea la variable para el texto del botón, va tipo final porque será requerida por el constructor
  final String text;
  //Se dejan los valores de alto y ancho del botón variables para poder utilizarlo en varias ocasiones, por lo que se inicializan las variables
  double height=0.0;
  double width=0.0;
  //Con Void Callback se define una variable que puede recibir una función como parámetro
  final VoidCallback onPressed;
  //Se arma un constructor con sintaxis Dart, utilizando llaves. Los key llaman automáticamnte los valores clave de ButtonGreen, como el onTap y los definidos
  ButtonGreen({Key key,@required this.text, @required this.onPressed, this.height, this.width});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _buttonGreen();
  }
}

class _buttonGreen extends State<ButtonGreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.only(
          top: 30.0,
          left: 20.0,
          right:20.0
        ),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: LinearGradient(
            colors: [
              Color(0xFFa7ff84), //arriba ó izquierda
              Color(0xFF1cbb78) //abajo ó derecha
            ],
            begin:FractionalOffset(0.2,0.0),
            end: FractionalOffset(1.0,0.6),
            stops:[0.0,0.6],
            tileMode: TileMode.clamp
          )
        ),
        child: Center(
          child: Text(
            //Se utiliza el widget de la variable text
            widget.text,
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'Lato',
              color: Colors.white,
            ),
          ),
        ),
      )
    );
  }

}