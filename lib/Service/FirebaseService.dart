import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper.dart';

class FirebaseService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> createUser({@required email, @required password}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((data) {
      prefs.setString(UserPref.email, data.user.email);
      prefs.setString(UserPref.userId, data.user.uid);
      return "";
    }).catchError((e) {
      return e.code.toString();
    });
  }

  Future<String> signIn(
      {@required String email, @required String password}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((data) {
      prefs.setString(UserPref.email, data.user.email);
      prefs.setString(UserPref.userId, data.user.uid);
      return "";
    }).catchError((e) {
      print(e);
      return e.code.toString();
    });
  }
}
