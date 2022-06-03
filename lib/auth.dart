import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';

class authService{
  final auth.FirebaseAuth _firebaseAuth;
  authService(this._firebaseAuth);
  Future<bool> signIn({required String email, required String password}) async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return true;
    } on auth.FirebaseAuthException catch (e){
      debugPrint(e.message ?? "unknown error");
    }
    return false;
  }
}