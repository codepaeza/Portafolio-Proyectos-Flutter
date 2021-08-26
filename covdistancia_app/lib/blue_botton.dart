import 'package:flutter/material.dart';

class BlueBotton extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _BlueBotton();
    }
    }
  class _BlueBotton extends State<BlueBotton> {
    void onPressedFav() {
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text("Activar Sensor Distancia"),));
    }
    @override
    Widget build(BuildContext context){
      return FloatingActionButton(
      backgroundColor: Color(0xFF000071),
      mini: true,
      tooltip: "Fav",
      onPressed: onPressedFav,
      child: Icon(
          Icons.bluetooth_searching
      ),
      heroTag: null,
    );
  }

  }