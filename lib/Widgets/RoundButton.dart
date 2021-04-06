import 'package:flutter/material.dart';
import 'package:recase/recase.dart';
import '../helper.dart';

enum AuthButtonType {
  logIn,
  signUp,
}

class RoundButton extends StatelessWidget {
  final AuthButtonType _type;
  final Function _didTap;

  String get _buttonText {
    ReCase rc = new ReCase(
      _type.toString().substring(_type.toString().indexOf('.') + 1),
    );
    return rc.titleCase;
  }

  RoundButton(this._type, this._didTap);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: double.infinity - 40,
      height: 40,
      child: ElevatedButton(
        onPressed: () => _didTap(),
        style: ElevatedButton.styleFrom(
          primary: appColor.orange,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0),
          ),
        ),
        child: Text(_buttonText, style: appTextStyle.semiBold15White),
      ),
    );
  }
}
