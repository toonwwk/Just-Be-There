import 'package:flutter/cupertino.dart';
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
        return "Unusual activity detected. Try again later.";
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
    return Dialog(
        elevation: 24,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0)
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
              children : [
              Container(
                height: 220,
                width: 210,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 70, 0, 10),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Text((_errorCode), style: appTextStyle.bold18Green,),
                    SizedBox(height: 15,),
                    Text((_errorMessage), style: appTextStyle.regular15Green,),
                    SizedBox(height: 20,),
                ],
                ),
              ),

            ),
                Positioned(
                    top: 20,
                    child: CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      radius: 30,
                      child: Icon(Icons.error, color: Colors.white, size: 60,),
                    )
                ),
          ],
        ),
    );
  }
}
