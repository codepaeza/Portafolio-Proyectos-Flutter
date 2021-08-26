import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Agencia Digital de Turismo",
      home: Scaffold(
        appBar: AppBar(
            title: Text("Maps Visible Agencia Digital"),
             backgroundColor: Colors.black87,),
        body: Builder (
            builder: (context) => SingleChildScrollView(
              child: Padding(
               padding: EdgeInsets.all(20),
               child:
                Center(
                 child: Column(children: [
                   Padding(
                    padding: EdgeInsets.all(10),
                     child: Text (
                   "Bienvenido a Maps Visible",
                       style: TextStyle(
                       fontSize: 26,
                       fontWeight: FontWeight.bold,
                       color: Colors.blue[800]),
                   ),
                  ),
                   Padding(
                    padding: EdgeInsets.all(5),
                     child: Text(
                      "Descubra la Comunidad Digital",
                       style: TextStyle(
                       fontSize: 20,
                       color: Colors.deepPurpleAccent),
                  ),
                 ),
                  Padding(
                   padding: EdgeInsets.all(15),
                    child: Container(
                     decoration: BoxDecoration(
                      boxShadow: [BoxShadow(
                        color:Colors.blue,
                        blurRadius: 20,
                        spreadRadius: 8)]),
                     child:
                       Image.network(
                       'https://images.freeimages.com/images/large-previews/eaa/the-beach-1464354.jpg',
                        height: 350)
                        ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child:
                          RaisedButton(
                           child: Text("Explorar"),
                            onPressed: () => contactanos(context),
                  ),
                 ),
                ],
               )

              )))))
          );
     }
}

void contactanos(BuildContext context){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Contáctanos"),
          content: Text("Escríbenos a mapsvisible@gmail.com"),
          actions: <Widget>[
            FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Cerrar"))
          ]
        );

       });
}

