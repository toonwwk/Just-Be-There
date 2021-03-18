import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jbt/helper.dart';

class SignUpText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity - 40,
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Do not have an account? ',
            style: appTextStyle.regular15Green,
          ),
          GestureDetector(
            onTap: () {
              log("Sign up");
            },
            child: Text(
              'Sign Up',
              style: appTextStyle.semiBold15Orange,
            ),
          )
        ],
      ),
    );
  }
}
