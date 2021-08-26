import 'package:flutter/material.dart';

class TitleInputLocation extends StatelessWidget{

  final String hintText;
  final TextEditingController controller;
  final IconData iconData;

  //Constructor
  TitleInputLocation({
    Key key,
    @required this.hintText,
    @required this.controller,
    @required this.iconData
});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(left: 20.0, right:20.0),
      child: TextField(
        controller: controller,
        style:TextStyle(
          fontSize: 15.0,
          fontFamily: "Lato",
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold
        ),
        //Decoración propia del TextField, independiente del Container
        decoration:InputDecoration(
          hintText: hintText,
          suffixIcon: Icon(iconData), //suffixIcon ubica el ícono a la derecha del widget, prefixIcon lo ubica a la izquierda
          fillColor: Color(0xFFFFFFFF),
          filled:true,
          border:InputBorder.none,
          enabledBorder:OutlineInputBorder(
            borderSide:BorderSide(color:Color(0xFFFFFFFF)),
            borderRadius: BorderRadius.all(Radius.circular(12.0))
          ),
          focusedBorder:OutlineInputBorder(
              borderSide:BorderSide(color:Color(0xFFFFFFFF)),
              borderRadius: BorderRadius.all(Radius.circular(12.0))
          ),
        )
      ),

        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color:Colors.black12,
              blurRadius: 15.0,
              offset:Offset(0.0, 7.0), //Diferencia de alineación de la sombra respecto al widget
            )
          ]

    )
    );
  }
}