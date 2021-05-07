import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart';

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

  Future<List<String>> uploadImage(
      List<Asset> _imageFile, String eventName) async {
    List<String> _urllist = [];
    print(_imageFile.length);
    int i = 0;
    _imageFile.forEach((imageAsset) async {
      final filePath =
          await FlutterAbsolutePath.getAbsolutePath(imageAsset.identifier);
      print(filePath);
      File imageFile = File(filePath);
      if (imageFile.existsSync()) {
        Reference reference =
            FirebaseStorage.instance.ref().child(eventName).child(i.toString());
        UploadTask uploadTask = reference.putFile(imageFile);
        uploadTask.then((res) async {
          String _url = await res.ref.getDownloadURL();
          _urllist.add(_url);
          print(_url);
        });
      }
      i += 1;
    });
    return _urllist;
  }
}
