import 'package:flutter/material.dart';
import 'package:flutter_app/place/model/place.dart';

class User{
  final String uid;
  final String name;
  final String email;
  final String photoURL;
  //Los siguientes datos se tomam de Places (places.dart)
  final List<Place> myPlaces;
  final List<Place> myFavoritePlaces;

  User({
    Key key,
    @required this.uid,
    @required this.name,
    @required this.email,
    @required this.photoURL,
    this.myPlaces,
    this.myFavoritePlaces
});
}