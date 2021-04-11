import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


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

class errorState {
  static generateExceptionMessage(exceptionCode) {
    String errorMessage;
    switch (exceptionCode) {
      case 'invalid-email':
        errorMessage = "The email address is badly formatted.";
        break;
      case "weakPassword":
        errorMessage = "The password must be 8 characters long or more.";
        break;
      case "user-disabled":
        errorMessage = "User has been disabled!, Try again";
        break;
      case 'email-already-in-use':
        errorMessage = 'The email address is already registered. Sign in instead?';
        break;
      case 'invalid-credential':
        errorMessage = 'The email address is badly formatted.';
        break;
      case 'too-many-requests':
        errorMessage = "We have blocked all requests from this device due to unusual activity. Try again later.";
        break;
      case 'user-not-found':
        errorMessage = "The email address is not registered. Need an account?";
        break;
      case 'wrong-password':
        errorMessage = "The password is incorrect. Please try again.";
        break;
      case 'unknown':
        errorMessage = "Unknown error";
        break;
    }
    return errorMessage;
  }
}



