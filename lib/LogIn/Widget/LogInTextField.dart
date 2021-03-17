import 'package:flutter/material.dart';

import '../../helper.dart';

enum LogInTextFieldType {
  username,
  password,
}

class LogInTextField extends StatelessWidget {
  final LogInTextFieldType _type;
  IconData get icon {
    return _type == LogInTextFieldType.username
        ? Icons.account_circle
        : Icons.lock;
  }

  String get placeHolder {
    return _type.toString().substring(_type.toString().indexOf('.') + 1);
  }

  OutlineInputBorder get border {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(
        color: appColor.green,
      ),
    );
  }

  LogInTextField(this._type);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(
        top: 15,
        left: 20,
        right: 20,
      ),
      child: TextField(
        keyboardType: TextInputType.name,
        style: appTextStyle.regular15Green,
        cursorColor: appColor.green,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: appColor.green,
          ),
          enabledBorder: border,
          focusedBorder: border,
          hintText: placeHolder,
          hintStyle: appTextStyle.regular15Green,
          contentPadding: EdgeInsets.all(3),
        ),
      ),
    );
  }
}
