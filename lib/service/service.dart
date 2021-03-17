import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> createUser({@required email, @required password, @required repassword}) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
      return _auth.createUserWithEmailAndPassword(email: email, password: password).then((data) {
          print("Registation Success");
          print(data.user.uid);
          return true;
      }).catchError((e) {
          print("Error: " + e);
          return false;
      });
  }

  Future<bool> signIn({@required String email, @required String password}){
     return _auth.signInWithEmailAndPassword(email: email, password: password).then((result) {
    print("Login Success");
    return true;
  }).catchError((e) {
    print(e);
    switch (e.code) {
      case "ERROR_WRONG_PASSWORD":
        print("Wrong Password! Try again.");
        break;
      case "ERROR_INVALID_EMAIL":
        print("Email is not correct!, Try again");
        break;
      case "ERROR_USER_NOT_FOUND":
        print("User not found! Register first!");
        break;
      case "ERROR_USER_DISABLED":
        print("User has been disabled!, Try again");
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        print(
            "Sign in disabled due to too many requests from this user!, Try again");
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        print(
            "Operation not allowed!, Please enable it in the firebase console");
        break;
      default:
        print("Unknown error");
    }
    return false;
   });
  }

}
