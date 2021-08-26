import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/place/model/place.dart';
import 'package:flutter_app/place/ui/widgets/card_image.dart';
import 'package:flutter_app/user/model/user.dart';
import 'package:flutter_app/user/ui/widgets/profile_place.dart';

import 'firebase_auth_api.dart';

class CloudFirestoreAPI{

  final String USERS="users";
  final String PLACES="places";

  final Firestore _db= Firestore.instance;
  final FirebaseAuth _auth=FirebaseAuth.instance;//Entidad traida de firebase_auth_api.dart

  void updateUserData(User user) async{
    DocumentReference ref=_db.collection(USERS).document(user.uid); //En BD Firebase, se accede a una colección y luego a un documento
    return await ref.setData({ //await para que se ejecute en segundo plano
      'uid':user.uid,
      'name':user.name,
      'email':user.email,
      'photoURL':user.photoURL,
      'myPlaces':user.myPlaces,
      'myFavoritePlaces':user.myFavoritePlaces,
      'lastSignIn':DateTime.now()

    },merge:true); //merge es equivalente al commit en DB para que el registro sea aplicado
  }

  Future<void> updatePlaceData(Place place) async{ //Este método se lleva a cloud_firestore_repository.dart y a bloc_user.dart
    //En el caso de los places, se deja a Firebase la responsabilidad de generar el identificador
    CollectionReference refPlaces=_db.collection(PLACES);

    //Para consultar el usuario actualmente logueado

    await _auth.currentUser().then((FirebaseUser user){
    refPlaces.add({ //Adiciona el id del documento para places y los parámetros definidos en place.dart
    'name': place.name,
    'description':place.description,
    'likes' : place.likes,
    'urlImage' : place.urlImage,
    'userOwner':_db.document("${USERS}/${user.uid}"),//Tipo de dato reference, llamando al user.id
    //'userOwner': "${USERS}/${user.uid}" //Tipo de dato String, llamando al user.id
    }).then((DocumentReference dr){
      dr.get().then((DocumentSnapshot snapshot){
       // snapshot.documentID; //Devuelve el ID del Place que se acaba de agregar
        DocumentReference refUsers=_db.collection(USERS).document(user.uid);
        refUsers.updateData({
          'myPlaces' : FieldValue.arrayUnion([_db.document("${PLACES}/${snapshot.documentID}")])
        });
      });
    }) ;
  });

  }
  List<ProfilePlace>buildMyPlaces(List<DocumentSnapshot> placesListSnapshot){
   List<ProfilePlace> profilePlaces=List<ProfilePlace>();
   placesListSnapshot.forEach((p){
     profilePlaces.add(ProfilePlace(
       Place(
           name: p.data['name'],
           description: p.data['description'],
           urlImage: p.data['urlImage'],
           likes: p.data['likes']),
     ));
   });
   return profilePlaces;
  }

  List<Place> buildPlaces(List<DocumentSnapshot> placesListSnapshot, User user) {
    List<Place> places = List<Place>();

    placesListSnapshot.forEach((p)  {
      Place place = Place(id: p.documentID, name: p.data["name"], description: p.data["description"],
          urlImage: p.data["urlImage"],likes: p.data["likes"]
      );
      List usersLikedRefs =  p.data["usersLiked"];
      place.liked = false;
      usersLikedRefs?.forEach((drUL){
        if(user.uid == drUL.documentID){
          place.liked = true;
        }
      });
      places.add(place);
    });
    return places;
  }





 /* List<CardImageWithFabIcon> buildPlaces(List<DocumentSnapshot> placesListSnapshot){
    double width=280.0;
    double height=280.0;
    double left=20.0;
    IconData iconData=Icons.favorite_border;

    List<CardImageWithFabIcon> placesCard= List<CardImageWithFabIcon>();
    placesListSnapshot.forEach((p){
      placesCard.add(CardImageWithFabIcon(
        pathImage: p.data["urlImage"],
        width: width,
        height: height,
        left: left,
        onPressedFabIcon: (){
          //Likes
          likePlace(p.documentID);

        },
        iconData: iconData,
        internet: true,
      )
      );
    });
    return placesCard;
  } */
  Future likePlace(Place place, String uid) async {
    await _db.collection(PLACES).document(place.id).get()
        .then((DocumentSnapshot ds){
      int likes = ds.data["likes"];

      _db.collection(PLACES).document(place.id)
          .updateData({
        'likes': place.liked?likes+1:likes-1,
        'usersLiked':
        place.liked?
        FieldValue.arrayUnion([_db.document("${USERS}/${uid}")]):
        FieldValue.arrayRemove([_db.document("${USERS}/${uid}")])
      });


    });
  }
}