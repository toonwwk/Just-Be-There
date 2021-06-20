import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:jbt/Models/EventForm.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../helper.dart';
import '../main.dart';

class ServiceManager with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> createUser({@required email, @required password}) async {
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

  Future<String> uploadImageToStorage(
      Asset imageAsset, String eventName, String fileName) async {
    File imageFile =
        File(await FlutterAbsolutePath.getAbsolutePath(imageAsset.identifier));
    Reference reference =
        FirebaseStorage.instance.ref().child(eventName).child(fileName);

    return await reference.putFile(imageFile).then((res) {
      return res.ref.getDownloadURL();
    }).catchError((e) {
      print(e.code.toString());
    });
  }

  Future<bool> uploadFormToFireStore(EventForm form) {
    return FirebaseFirestore.instance
        .collection("NewEventRequests")
        .doc(form.eventName)
        .set({
      "event-name": form.eventName,
      "address": form.address,
      "description": form.description,
      "start-date": form.startDate,
      "end-date": form.endDate,
      "tel": form.tel,
      "lat": form.lat,
      "long": form.long,
      "url-list": form.urlList,
      "status": false,
    }).then((value) {
      return true;
    }).catchError((onError) {
      return false;
    });
  }

  Future<List<EventForm>> fetchEventFromFirestore() async {
    return await FirebaseFirestore.instance
        .collection("NewEventRequests")
        .where("status", isEqualTo: true)
        .get()
        .then((value) {
      List<EventForm> eventList = [];
      value.docs.forEach((form) {
        List<String> urlList = new List<String>.from(form["url-list"]);
        EventForm event = EventForm(
          form["event-name"],
          form["address"],
          form["description"],
          form["start-date"],
          form["end-date"],
          form["tel"],
          form["lat"],
          form["long"],
          urlList,
        );
        eventList.add(event);
      });
      print("done fetch");
      return eventList;
    }).catchError((e) {
      print("error");
      print(e.toString());
    });
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    prefs.setString(UserPref.email, "");
    prefs.setString(UserPref.userId, "");
    print("Sign out successfully");
  }
}
