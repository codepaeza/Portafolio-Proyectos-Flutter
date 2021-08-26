import 'package:flutter/material.dart';
import 'package:flutter_app/user/bloc/bloc_user.dart';
import 'package:flutter_app/user/model/user.dart';
import 'package:flutter_app/user/ui/screens/profile_header.dart';
import 'package:flutter_app/user/ui/widgets/profile_places_list.dart';
import 'package:flutter_app/user/ui/widgets/profile_background.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ProfileTrips extends StatelessWidget {
  BlocUser blocUser;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    blocUser=BlocProvider.of<BlocUser>(context);
    /*return Container(
      color: Colors.indigo,
    );*/
    return StreamBuilder(
      stream: blocUser.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        switch (snapshot.connectionState){
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.active:
            return showProfileData(snapshot);
          case ConnectionState.done:
            return showProfileData(snapshot);
          case ConnectionState.none:
            return CircularProgressIndicator();
          default:
        }
      },
    );


    /* Stack(
      children: <Widget>[
        ProfileBackground(),
        ListView(
          children: <Widget>[
            ProfileHeader(),
            ProfilePlacesList()

          ],
        ),
      ],
    );*/
  }

  Widget showProfileData(AsyncSnapshot snapshot){
    if(!snapshot.hasData || snapshot.hasError){
      print("Usuario no logueado");
      return Stack(
        children: <Widget>[
          ProfileBackground(),
          ListView(
            children: <Widget>[
              Text("Usuario no logueado.Haz login")

            ],
          ),
        ],
      );
    } else{
      print("Usuario logueado");
      var user=User(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoUrl,
      );
      return Stack(
        children: <Widget>[
          ProfileBackground(),
          ListView(
            children: <Widget>[
              ProfileHeader(user),
              ProfilePlacesList(user)

            ],
          ),
        ],
      );
    }
  }
}