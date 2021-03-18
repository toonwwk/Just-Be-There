import 'package:flutter/material.dart';

import '../../helper.dart';

enum TextFieldType {
  username,
  password,
}

class AuthTextField extends StatelessWidget {
  final TextFieldType _type;
  final Color _borderColor;
  IconData get icon {
    return _type == TextFieldType.username ? Icons.account_circle : Icons.lock;
  }

  String get placeHolder {
    return _type.toString().substring(_type.toString().indexOf('.') + 1);
  }

  OutlineInputBorder get border {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(
        color: _borderColor,
      ),
    );
  }

  AuthTextField(this._type, this._borderColor);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: TextField(
        keyboardType: TextInputType.name,
        style: appTextStyle.regular15Green,
        cursorColor: appColor.green,
        cursorWidth: 1,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: appColor.green,
          ),
          enabledBorder: border,
          focusedBorder: border,
          hintText: placeHolder,
          hintStyle: appTextStyle.regular15Gray,
          contentPadding: EdgeInsets.all(3),
        ),
      ),
    );
  }
}
