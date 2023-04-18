import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  //tout d'abord, il faut creer les variables qui vont contenir les instances des differents services

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  //fonction qui va établir la connexion avec google

  Future<UserCredential> signInWithGoogle() async {
    //declencher le flux d'authentification
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    //obtenir les details d'autorisation de la demande
    final googleAuth = await googleUser!
        .authentication; // le ! c'est parceque cette valeur ne peut pas etre nulle

    // creer un nouvel identifiant
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    //une fois connecté, renvoyer l'identifiant de l'utilisateur

    return await _auth.signInWithCredential(credential);
  }

  //l'état de l'utilisateur en temps réel
  Stream<User?> get user => _auth.authStateChanges();

  //deconnexion d'un utilisateur
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
