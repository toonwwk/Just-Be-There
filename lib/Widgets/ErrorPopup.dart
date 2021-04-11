import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

class ErrorPopup extends StatelessWidget {
  final String _errorCode;

  String get _errorMessage {
    switch (_errorCode) {
      case 'invalid-email':
        return "The email address is badly formatted.";
        break;
      case "weakPassword":
        return "The password must be 8 characters long or more.";
        break;
      case "user-disabled":
        return "User has been disabled!, Try again";
        break;
      case 'email-already-in-use':
        return 'The email address is already registered. Sign in instead?';
        break;
      case 'invalid-credential':
        return 'The email address is badly formatted.';
        break;
      case 'too-many-requests':
        return "We have blocked all requests from this device due to unusual activity. Try again later.";
        break;
      case 'user-not-found':
        return "The email address is not registered. Need an account?";
        break;
      case 'wrong-password':
        return "The password is incorrect. Please try again.";
        break;
      case 'unknown':
        return "Unknown error";
        break;
      default:
        return "Unknown error";
    }
  }

  ErrorPopup(this._errorCode);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(
          ("Error"),
          style: appTextStyle.bold15Green,
        ),
        content: Text(
          (_errorMessage),
          style: appTextStyle.regular15Green,
        ));
  }
}
