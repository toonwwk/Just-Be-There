import 'package:flutter/material.dart';

class User {
  const User({
    @required this.uid,
    this.email,
  });

  final String uid;
  final String email;
}
