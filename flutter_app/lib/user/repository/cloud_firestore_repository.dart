import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/place/model/place.dart';
import 'package:flutter_app/place/ui/widgets/card_image.dart';
import 'package:flutter_app/user/model/user.dart';
import 'package:flutter_app/user/repository/cloud_firestore_api.dart';
import 'package:flutter_app/user/ui/widgets/profile_place.dart';

class CloudFirestoreRepository{
  final _cloudFirestoreAPI=CloudFirestoreAPI();
  void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);

  //Se trae el método de cloud_firestore_api.dart
  Future<void> upDatePlaceData(Place place) => _cloudFirestoreAPI.updatePlaceData(place);

List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot)=>_cloudFirestoreAPI.buildMyPlaces(placesListSnapshot);
//List<CardImageWithFabIcon> buildPlaces(List<DocumentSnapshot> placesListSnapshot)=>_cloudFirestoreAPI.buildPlaces(placesListSnapshot);
List<Place> buildPlaces(List<DocumentSnapshot> placesListSnapshot, User user) => _cloudFirestoreAPI.buildPlaces(placesListSnapshot, user);
Future likePlace(Place place, String uid) => _cloudFirestoreAPI.likePlace(place,uid);
}