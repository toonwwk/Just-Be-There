import 'package:flutter/material.dart';
import '../../helper.dart';

class RoundButton extends StatelessWidget {
  final String _text;

  RoundButton(this._text);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity - 40,
      height: 40,
      child: ElevatedButton(
        onPressed: () => print('Login'),
        style: ElevatedButton.styleFrom(
          primary: appColor.orange,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0),
          ),
        ),
        child: Text(_text, style: appTextStyle.semiBold15White),
      ),
    );
  }
}
