import 'package:flutter/material.dart';
import 'package:flutter_app/user/model/user.dart';
import 'package:flutter_app/widgets/gradient_back.dart';
import 'package:flutter_app/widgets/button_green.dart';
import 'package:flutter_app/user/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/platzi_trips_cupertino.dart';

class SignInScreen extends StatefulWidget {


  @override
  State createState() {
   return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen>{
  BlocUser blocUser;
  double screenWidth;
  @override

  Widget build(BuildContext context) {
    //Se utiliza la siguiente líe de código para que la apliación se ajuste al ancho de la pnatalla del dispositivo movil
    screenWidth= MediaQuery.of(context).size.width;
    // TODO: implement build
    blocUser= BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession(){
    return StreamBuilder(
        stream: blocUser.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          //snapshot contiene los datos, contiene al objeto user

          if(!snapshot.hasData || snapshot.hasError) {
           return signInGoogleUI();
          }else{
            return PlatziTripsCupertino();
          }
        },
    );
  }
  Widget signInGoogleUI(){
    return Scaffold(
      body: Stack(
        children:<Widget>[
          GradientBack(heigth: null),//El parámetro null lo pone a full screen
            Column(
              mainAxisAlignment: MainAxisAlignment.center, //Esta propiedad centra vertical el texto y el botón
              children: <Widget>[
                //El widget Flexible en la estructura que se muestra a continuación, evita el desbordamiento del texto en la pantalla
                Flexible(
                  child: Container(
                    width: screenWidth,
                   child: Text("Bienvenido \n lo invitamos a \n iniciar la mejor \n experiencia",
                style:TextStyle(
                  fontSize: 37.0,
                  fontFamily: 'Lato',
                  color:Colors.white,
                  fontWeight: FontWeight.bold
                ),
                ),
                ),
                ),
                //Se implementa el button_green
                ButtonGreen(text: "Login with Gmail",
                    onPressed:(){
                    blocUser.signOut();
                    blocUser.signIn().then((FirebaseUser user){
                      blocUser.updateUserData(User(
                        uid:user.uid,
                        name:user.displayName,
                        email:user.email,
                        photoURL: user.photoUrl
                      ));
                    });
                    },
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
