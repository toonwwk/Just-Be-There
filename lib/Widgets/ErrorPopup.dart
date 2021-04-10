import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';




class ErrorPopup extends StatefulWidget {
  @override
  errorState createState() => errorState();
// ErrorPopup(this._errorCode);
}

class errorState extends State<ErrorPopup>{

  String _errorCode = 'None';
  _errorMessages(_errorCode){
    switch(_errorCode){
      case 'weak-password':
        return 'The password must be 8 characters long or more.';
        break;
      case 'invalid-email':
        return 'The email address is badly formatted.';
        break;
      case 'unknown':
        return 'Unknown error';
        break;
      case 'email-already-in-use':
        return 'The email address is already registered. Sign in instead?';
        break;
      case '':
        return 'Unknown error';
        break;
      case 'None':
        return 'Successful!';
        break;
    }
  }
  void showError(BuildContext context,String _errorCode) {
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: new Text(_errorCode!=null?_errorCode:"error"),
          content: new Text(_errorMessages(_errorCode)!=null?_errorMessages(_errorCode):"error"),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}



  // final String _errorCode;
  // static Map<String, String> _errorMessages = {
  //   'ERROR_WEAK_PASSWORD': 'The password must be 8 characters long or more.',
  //   'ERROR_INVALID_CREDENTIAL': 'The email address is badly formatted.',
  //   'ERROR_EMAIL_ALREADY_IN_USE': 'The email address is already registered. Sign in instead?',
  //   'ERROR_INVALID_EMAIL': 'The email address is badly formatted.',
  //   'ERROR_WRONG_PASSWORD': 'The password is incorrect. Please try again.',
  //   'ERROR_USER_NOT_FOUND': 'The email address is not registered. Need an account?',
  //   'ERROR_TOO_MANY_REQUESTS': 'We have blocked all requests from this device due to unusual activity. Try again later.',
  //   'ERROR_USER_DISABLED': 'User has been disabled!, Try again',
  // };



  // String get _errorMessage {
  //   return _errorMessages[_errorCode] ?? 'Unknown error, contact support';
  // }

