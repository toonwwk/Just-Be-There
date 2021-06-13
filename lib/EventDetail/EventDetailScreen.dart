import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jbt/Models/EventForm.dart';
import '../helper.dart';

enum AuthStatus {
  successful,
  emailAlreadyExists,
  weakPassword,
  invalidEmail,
  userNotFound,
  userDisabled,
  tooManyRequests,
  unknown,
}

class EventDetailScreen extends StatelessWidget {
  EventForm _event;

  EventDetailScreen(this._event);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: appColor.lightGray,
        ),
        centerTitle: true,
        backgroundColor: appColor.green,
        title: Text(
          _event.eventName,
          style: appTextStyle.bold18Gray,
        ),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
