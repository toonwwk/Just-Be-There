import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jbt/MyBottomNav.dart';
import 'package:jbt/Service/ServiceManager.dart';
import 'package:jbt/Widgets/ErrorPopup.dart';
import 'package:jbt/Widgets/LeftIconTextField.dart';
import 'package:jbt/Widgets/RoundButton.dart';
import 'package:jbt/Widgets/SignUpText.dart';
import 'package:jbt/helper.dart';
import 'package:provider/provider.dart';
import '../InfoWindowModel.dart';

class UserLoginScreen extends StatefulWidget {
  final bool needPop;

  UserLoginScreen({this.needPop});

  @override
  LogInScreen createState() => LogInScreen();
}

class LogInScreen extends State<UserLoginScreen> {
  Position _currentPosition;
  static const routeName = '/login';
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final ServiceManager _service = ServiceManager();
  String errorMsg;
  String error;

  @override
  void initState() {
    super.initState();
  }

  void didTapLogInButton() async {
    await _service
        .signIn(
      email: emailController.text,
      password: passwordController.text,
    )
        .then((errorCode) {
      if (errorCode.isNotEmpty) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorPopup(errorCode);
          },
        );
        print("error " + errorCode);
      } else {
        print("sign in success");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (context) => InfoWindowModel(),
              child: MyBottomNav(),
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
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
                SizedBox(height: deviceSize.height * .1),
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
                LeftIconTextField(
                  TextFieldType.email,
                  appColor.green,
                  appColor.green,
                  emailController,
                ),
                SizedBox(
                  height: 15,
                ),
                LeftIconTextField(
                  TextFieldType.password,
                  appColor.green,
                  appColor.green,
                  passwordController,
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  child: RoundButton(
                    AuthButtonType.logIn,
                    didTapLogInButton,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SignUpText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  addStringToSF() {
    print(_currentPosition.latitude.toString());
    print(_currentPosition.longitude.toString());
  }
}
