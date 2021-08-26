import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_app/place/model/place.dart';
import 'package:flutter_app/place/repository/firebase_storage_repository.dart';
import 'package:flutter_app/place/ui/widgets/card_image.dart';
import 'package:flutter_app/user/model/user.dart';
import 'package:flutter_app/user/repository/auth_repository.dart';
import 'package:flutter_app/user/repository/cloud_firestore_api.dart';
import 'package:flutter_app/user/repository/cloud_firestore_repository.dart';
import 'package:flutter_app/user/ui/widgets/profile_place.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BlocUser extends Bloc{

  final _auth_repository=AuthRepository();
  //El flujo de datos se denomina Stream - Para este caso, el flujo de datos viene de Firebase
  //Firebase ya vien preparado con la estructura de Stream
  //Si la fuente de datos es diferente, se debe utiizar la clase StreamControler de Flutter para manejar el Stream

  Stream<FirebaseUser> streamFirebase=FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;
  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();

  //Este archivo va a contener los casos de uso del objeto user
  //Caso 1: Hacer Sign In a la aplicación con Google

  Future<FirebaseUser> signIn() => _auth_repository.signInFirebase();

  //Caso 2: Registrar usuario en base de datos

  final _cloudFirestoreRepository= CloudFirestoreRepository();
  void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);

  //Caso 3: Enviar a base e datos los datos del place

  //Se trae el método de cloud_firestore_api.dart
  Future<void> updatePlaceData(Place place) => _cloudFirestoreRepository.upDatePlaceData(place);



  //Póngase en escucha de lo que se encuentre en la instancia de la base de datos, cuya coección corresponda a los places
  Stream<QuerySnapshot> placesListStream = Firestore.instance.collection(CloudFirestoreAPI().PLACES).snapshots();
  //Escucha el litao de places y este conecta con la clase profile_places_list.dart
  Stream<QuerySnapshot> get placesStream => placesListStream;
  //List<CardImageWithFabIcon> buildPlaces(List<DocumentSnapshot> placesListSnapshot)=>_cloudFirestoreRepository.buildPlaces(placesListSnapshot);
  List<Place> buildPlaces(List<DocumentSnapshot> placesListSnapshot, User user) => _cloudFirestoreRepository.buildPlaces(placesListSnapshot, user);
  Future likePlace(Place place, String uid) => _cloudFirestoreRepository.likePlace(place,uid);

  Stream<QuerySnapshot> myPlacesListStream(String uid)=>
  Firestore.instance.collection(CloudFirestoreAPI().PLACES)
  .where("userOwner", isEqualTo: Firestore.instance.document("${CloudFirestoreAPI().USERS}/${uid}")).snapshots();
  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot>placesListSnapshot)=>_cloudFirestoreRepository.buildMyPlaces(placesListSnapshot);

  StreamController<Place> placeSelectedStreamController =  StreamController<Place>();
  Stream<Place> get placeSelectedStream => placeSelectedStreamController.stream;
  StreamSink<Place> get placeSelectedSink =>  placeSelectedStreamController.sink;


  // Carga la imagen en el Firebase Storage
  final _firebaseStorageRepository=FirebaseStorageRepository();
  Future<StorageUploadTask> uploadFile(String path, File image) => _firebaseStorageRepository.uploadFile(path, image);
  //Caso : Salida - SignOut-
  signOut(){
    _auth_repository.signOut();
  }
  @override
  void dispose() {

  }

}