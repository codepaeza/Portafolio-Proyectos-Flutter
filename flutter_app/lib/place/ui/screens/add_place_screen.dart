import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/place/model/place.dart';
import 'package:flutter_app/place/ui/widgets/card_image.dart';
import 'package:flutter_app/place/ui/widgets/title_input_location.dart';
import 'package:flutter_app/user/bloc/bloc_user.dart';
import 'package:flutter_app/widgets/button_purple.dart';
import 'package:flutter_app/widgets/gradient_back.dart';
import 'package:flutter_app/widgets/text_input.dart';
import 'package:flutter_app/widgets/title_header.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class AddPlaceScreen extends StatefulWidget{

  File image;
  AddPlaceScreen({Key key, this.image});

  @override
  State createState(){
    return _AddPlaceScreen();
    }
  }

class _AddPlaceScreen extends State<AddPlaceScreen>{
  @override
  Widget build(BuildContext context) {
//Para tener capturado el texto en cada uno de los text field
    BlocUser blocUser= BlocProvider.of<BlocUser>(context);
    final _controllerTitlePlace=TextEditingController();
    final _controllerDescriptionPlace=TextEditingController();

    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(
            heigth: 300.0,
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top:25.0, left:5.0),
                child: SizedBox( //Cuadro que encierra el ícono de back, para que cliquear sea más fácil
                height:45.0,
                width: 45.0,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_left, color:Colors.white, size:45.0,),
                  onPressed:() {
                    Navigator.pop(context);//Devuelve a la pantalla anterior
                  }
                ),
                ),
              ),

              Flexible(
                child: Container(
                  padding: EdgeInsets.only(top:45.0, left:20.0, right:10.0),
                  child: TitleHeader(title: "Ingrese un nuevo lugar"),
                )
              )
             ],
          ),

          //Creación de Safe Area
          Container(
            margin:EdgeInsets.only(top:120.0, bottom: 20.0),
            child:ListView( //Al incluir en ListView los elementos, se organizan y se garantiza el scroll vertical
              children:<Widget>[
                Container(
                  alignment: Alignment.center,
                  child: CardImageWithFabIcon(
                    pathImage: widget.image.path, //widget.image.path,
                    iconData: Icons.camera_alt,
                    width: 350.0,
                    height: 250.0,
                    left: 0.0,
                    internet: false,
                  ),
                ),//Contenedor de la foto
                Container( //TextField  Title
                  margin:EdgeInsets.only(top: 20.0, bottom:20.0),
                  child:TextInput(
                    hintText: "Nombre Lugar",
                    inputType: null,
                    maxLines: 1,
                    controller:_controllerTitlePlace,
                  ),
                 ),
                TextInput( //El asociado a Description Text Field
                  hintText: "Descripción del lugar",
                  inputType: TextInputType.multiline,
                  maxLines: 4,
                  controller: _controllerDescriptionPlace,
                ),
                Container(
                 margin:EdgeInsets.only(top:20.0),
                  child: TitleInputLocation(
                    hintText: "Adicione un lugar",
                    iconData: Icons.location_on,
                  ),
                ),
                Container(
                  width: 70.0,
                  child: ButtonPurple(
                    buttonText: "Agregar Lugar",
                    onPressed: () {

                      //   Obtiene el ID del usuario logueado actualmente
                      blocUser.currentUser.then((FirebaseUser user){
                        if (user !=null){
                          //1. Envía imagen al Firebase Storage
                          //2. Obtiene la url de la imagen devuelta por Firebase Storage
                          String uid= user.uid;
                          String path="{$uid}/${DateTime.now().toString()}.jpg"; //Ruta para la creación de nombre de imagen utilizando fecha y hora del sistema
                          blocUser.uploadFile(path, widget.image).then((StorageUploadTask storageUploadTask){
                            storageUploadTask.onComplete.then((StorageTaskSnapshot snapshot){
                              snapshot.ref.getDownloadURL().then((urlImage){
                                print("URLIMAGE:${urlImage}");

                                //4. Se inserta en el Cloud el objeto lugar con sus propiedades: title, description, url imagen, user Owner, likes
                                blocUser.updatePlaceData(Place(
                                  name: _controllerTitlePlace.text,
                                  description: _controllerDescriptionPlace.text,
                                  urlImage: urlImage,
                                  likes: 0,
                                )).whenComplete(() {
                                  print("FINALIZADO");
                                  Navigator.pop(context);
                                });

                              });
                            });

                          });
                        }
                      });
                      //3. Se comunica con el Cloud Firestore

                    },
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}