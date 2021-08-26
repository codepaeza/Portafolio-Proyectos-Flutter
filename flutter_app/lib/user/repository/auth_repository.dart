import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/user/repository/firebase_auth_api.dart';

class AuthRepository {
  final _firebaseAuthAPI= FirebaseAuthAPI();
  Future<FirebaseUser> signInFirebase()=> _firebaseAuthAPI.signIn();
  signOut() => _firebaseAuthAPI.signOut();//Cierre de sesión en Firebase

}
