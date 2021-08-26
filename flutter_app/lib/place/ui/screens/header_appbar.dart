import 'package:flutter/material.dart';
import 'package:flutter_app/user/bloc/bloc_user.dart';
import 'package:flutter_app/user/model/user.dart';
import 'package:flutter_app/widgets/gradient_back.dart';
import 'package:flutter_app/place/ui/widgets/card_image_list.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

/*class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        GradientBack(heigth:250.0),//Se incluye 250.0 debido a que en el gradient_back.dart se había modificado este valor
        CardImageList()
      ],
    );
  }

}*/

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    BlocUser blocUser;
    blocUser = BlocProvider.of<BlocUser>(context);

    return StreamBuilder(
      stream: blocUser.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        switch (snapshot.connectionState){
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator(),);
          case ConnectionState.none:
            return Center(child: CircularProgressIndicator(),);
          case ConnectionState.active:
            return showPlacesData(snapshot);
          case ConnectionState.done:
            return showPlacesData(snapshot);
          default:
            return showPlacesData(snapshot);
        }
      },
    );




  }


  Widget showPlacesData(AsyncSnapshot snapshot){
    if(!snapshot.hasData || snapshot.hasError){
      return Stack(
        children: <Widget>[
          GradientBack(heigth: 250.0),
          Text("Usuario no logeado. Haz Login")
        ],
      );
    } else {
      User user = User(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoUrl
      );

      return Stack(
        children: <Widget>[
          GradientBack(heigth: 250.0),
          CardImageList(user)  //user
        ],
      );
    }
  }
}