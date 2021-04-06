import 'package:flutter/material.dart';
import '../helper.dart';

enum TextFieldType {
  email,
  password,
  detail,
  tel,
}

class LeftIconTextField extends StatelessWidget {
  final TextFieldType _type;
  final Color _borderColor;
  final Color _iconColor;
  final TextEditingController _controller;
  TextInputType _keyboardType;
  int _maxLines;
  IconData _icon;

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

  LeftIconTextField(
      this._type, this._borderColor, this._iconColor, this._controller) {
    configureViewDetail();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        keyboardType: _keyboardType,
        obscureText: _type == TextFieldType.password ? true : false,
        controller: _controller,
        style: appTextStyle.regular15Green,
        cursorColor: appColor.green,
        cursorWidth: 1,
        enableSuggestions: false,
        autocorrect: false,
        maxLines: _maxLines,
        decoration: InputDecoration(
          prefixIcon: Icon(
            _icon,
            color: _iconColor,
          ),
          enabledBorder: border,
          focusedBorder: border,
          hintText: placeHolder,
          hintStyle: appTextStyle.regular15Gray,
          contentPadding: EdgeInsets.symmetric(
            vertical: _type == TextFieldType.detail ? 12 : 3,
          ),
        ),
      ),
    );
  }

  void configureViewDetail() {
    switch (_type) {
      case TextFieldType.email:
        {
          _icon = Icons.account_circle;
          _maxLines = 1;
          _keyboardType = TextInputType.emailAddress;
        }
        break;
      case TextFieldType.password:
        {
          _icon = Icons.lock;
          _maxLines = 1;
          _keyboardType = TextInputType.visiblePassword;
        }
        break;
      case TextFieldType.detail:
        {
          _icon = Icons.info_outline_rounded;
          _maxLines = 5;
          _keyboardType = TextInputType.multiline;
        }
        break;
      case TextFieldType.tel:
        {
          _icon = Icons.local_phone;
          _maxLines = 1;
          _keyboardType = TextInputType.phone;
        }
        break;
    }
  }
}
