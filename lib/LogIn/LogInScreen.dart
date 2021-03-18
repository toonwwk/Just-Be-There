import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jbt/Widgets/Authentication/AuthTextField.dart';
import 'package:jbt/Widgets/Authentication/RoundButton.dart';
import 'package:jbt/helper.dart';
import 'package:jbt/Widgets/Authentication/SignUpText.dart';
import 'package:jbt/SignUp/SignUpScreen.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: size.height * .12),
                Image(
                  image: appAsset.icon,
                  width: 190,
                  height: 138,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'JUST BE THERE',
                  style: appTextStyle.bold18Green,
                ),
                SizedBox(
                  height: 50,
                ),
                AuthTextField(
                  TextFieldType.username,
                  appColor.green,
                ),
                SizedBox(
                  height: 15,
                ),
                AuthTextField(
                  TextFieldType.password,
                  appColor.green,
                ),
                SizedBox(
                  height: 15,
                ),
                RoundButton(
                  "Log In",
                ),
                SizedBox(
                  height: 15,
                ),
                SignUpText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
