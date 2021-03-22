import 'package:flutter/widgets.dart';

class ErrorPopup extends StatelessWidget {
  final String _errorCode;
  static Map<String, String> _errorMessages = {
    'ERROR_WEAK_PASSWORD': 'The password must be 8 characters long or more.',
    'ERROR_INVALID_CREDENTIAL': 'The email address is badly formatted.',
    'ERROR_EMAIL_ALREADY_IN_USE':
        'The email address is already registered. Sign in instead?',
    'ERROR_INVALID_EMAIL': 'The email address is badly formatted.',
    'ERROR_WRONG_PASSWORD': 'The password is incorrect. Please try again.',
    'ERROR_USER_NOT_FOUND':
        'The email address is not registered. Need an account?',
    'ERROR_TOO_MANY_REQUESTS':
        'We have blocked all requests from this device due to unusual activity. Try again later.',
    'ERROR_USER_DISABLED': 'User has been disabled!, Try again',
  };

  String get _errorMessage {
    return _errorMessages[_errorCode] ?? 'Unknown error, contact support';
  }

  ErrorPopup(this._errorCode);

  //NOTE: implement popup for showing error message
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
