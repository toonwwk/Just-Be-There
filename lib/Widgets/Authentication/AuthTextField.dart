import 'package:flutter/material.dart';

import '../../helper.dart';

enum TextFieldType {
  email,
  password,
}

class AuthTextField extends StatelessWidget {
  final TextFieldType _type;
  final Color _color;
  IconData get icon {
    return _type == TextFieldType.email ? Icons.account_circle : Icons.lock;
  }

  String get placeHolder {
    return _type.toString().substring(_type.toString().indexOf('.') + 1);
  }

  OutlineInputBorder get border {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(
        color: _color,
      ),
    );
  }

  AuthTextField(this._type, this._color);

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
            color: _color,
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
