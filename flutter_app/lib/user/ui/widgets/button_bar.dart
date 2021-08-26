import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app/place/ui/screens/add_place_screen.dart';
import 'package:flutter_app/user/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {
  BlocUser blocUser;

  @override
  Widget build(BuildContext context) {
    blocUser= BlocProvider.of(context);
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 10.0
        ),
        child: Row(
          children: <Widget>[
            //Cambiar la contraseña
            CircleButton(true, Icons.vpn_key, 20.0, Color.fromRGBO(255, 255, 255, 0.6), ()=>{}), //()=>{} trae el valor requerido onPressed de CircleButton
            //Añadir un nuevo lugar
            CircleButton(false, Icons.add, 40.0, Color.fromRGBO(255, 255, 255, 1), (){ //La flecha => solo deja insertar una lína de código, por esto se quita
              //Se debe importar el paquete dart:io;

              ImagePicker.pickImage(source:ImageSource.camera).then((File image){
                Navigator.push(context,
                    MaterialPageRoute(builder:(BuildContext context)=>AddPlaceScreen(image: image)));
              }
              ).catchError((onError)=> print(onError));

            }),
            //Cerrar sesión
            CircleButton(true, Icons.exit_to_app, 20.0, Color.fromRGBO(255, 255, 255, 0.6),
                    ()=>{
                      blocUser.signOut()
                    }),

          ],
        )
    );
  }

}