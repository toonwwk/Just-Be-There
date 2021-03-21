import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jbt/Models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper.dart';

class AuthenticationProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User> createUser({@required email, @required password}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final User user = await _auth
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((data) {
      print("Registation Success");
      prefs.setString(UserPref.email, data.user.email);
      prefs.setString(UserPref.userId, data.user.uid);
      return User(uid: data.user.uid, email: data.user.email);
    }).catchError((e) {
      print(e);
      return null;
    });

    return user;
  }

  Future<bool> signIn(
      {@required String email, @required String password}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((data) {
      log("Login Success");
      prefs.setString(UserPref.email, data.user.email);
      prefs.setString(UserPref.userId, data.user.uid);
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
