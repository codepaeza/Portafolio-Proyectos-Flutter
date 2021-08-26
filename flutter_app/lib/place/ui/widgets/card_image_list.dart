import 'package:flutter/material.dart';
import 'package:flutter_app/place/model/place.dart';
import 'package:flutter_app/user/bloc/bloc_user.dart';
import 'package:flutter_app/user/model/user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'card_image.dart';

import 'package:flutter_app/widgets/floating_action_button_green.dart';

class CardImageList extends StatefulWidget {

  User user;

  CardImageList(@required this.user);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CardImageList();
  }
}
BlocUser blocUser;

class _CardImageList extends State<CardImageList> {
  //BlocUser blocUser;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    blocUser = BlocProvider.of<BlocUser>(context);

    return Container(
        height: 350.0,
        child: StreamBuilder(
            stream: blocUser.placesStream,
            builder: (context, AsyncSnapshot snapshot){
              switch (snapshot.connectionState){
                case ConnectionState.waiting:
                  print("PLACESLIST: WAITING");
                  return CircularProgressIndicator();
                case ConnectionState.none:
                  print("PLACESLIST: NONE");
                  return CircularProgressIndicator();
                case ConnectionState.active:
                  print("PLACESLIST: ACTIVE");
                  return listViewPlaces(blocUser.buildPlaces(snapshot.data.documents, widget.user));
              //return listViewPlaces(userBloc.buildPlaces(snapshot.data.documents));
                case ConnectionState.done:
                  print("PLACESLIST: DONE");
                  return listViewPlaces(blocUser.buildPlaces(snapshot.data.documents, widget.user));

                default:
                  print("PLACESLIST: DEFAULT");

              }
            }
        )
    );




  }


  Widget listViewPlaces(List<Place> places){

    void setLiked(Place place){
      setState(() {
        place.liked = !place.liked;
        blocUser.likePlace(place, widget.user.uid);
        place.likes = place.liked?place.likes+1:place.likes-1;
        blocUser.placeSelectedSink.add(place);
      });
    }

    IconData iconDataLiked = Icons.favorite;
    IconData iconDataLike = Icons.favorite_border;
    return ListView(
      padding: EdgeInsets.all(25.0),
      scrollDirection: Axis.horizontal,
      children: places.map((place){
        return GestureDetector(
            onTap: (){
              print("CLICK PLACE: ${place.name}");
              blocUser.placeSelectedSink.add(place);
            },
        child: CardImageWithFabIcon(
          pathImage: place.urlImage,
          width: 300.0,
          height: 250.0,
          left: 20.0,
          iconData: place.liked?iconDataLiked:iconDataLike,
          onPressedFabIcon: (){
            setLiked(place);
          },
          internet: true,
        ),
        );
      }).toList(),
    );
  }





}






















/*class CardImageList extends StatelessWidget {
BlocUser blocUser;
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
     blocUser=BlocProvider.of<BlocUser>(context);
    return Container(
      height: 350.0,
      child: StreamBuilder(
        stream: blocUser.placesStream,
        builder: (context, AsyncSnapshot snapshot){
          switch (snapshot.connectionState){
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.active:
              return listViewPlaces(blocUser.buildPlaces(snapshot.data.documents));
            case ConnectionState.done:
              return listViewPlaces(blocUser.buildPlaces(snapshot.data.documents));
            case ConnectionState.none:
              return CircularProgressIndicator();
            default:
          }
        }

      )

    );
  }

  Widget listViewPlaces(List<CardImageWithFabIcon> placesCard){
     return ListView(
       padding: EdgeInsets.all(25.0),
       scrollDirection: Axis.horizontal,
       children: placesCard ,
     );
  }

}*/