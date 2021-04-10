import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jbt/Service/FirebaseService.dart';
import 'package:jbt/Widgets/ErrorPopup.dart';
import 'package:jbt/Widgets/LeftIconTextField.dart';
import 'package:jbt/Widgets/RoundButton.dart';
import 'package:jbt/helper.dart';
import 'package:jbt/Widgets/province.dart';

class UserSignUpScreen extends StatefulWidget {
  final bool needPop;

  UserSignUpScreen({this.needPop});

  @override
  SignUpScreen createState() => SignUpScreen();
}


class SignUpScreen extends State<UserSignUpScreen> {
  static const routeName = '/signup';
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final FirebaseService _service = FirebaseService();
  String errorMsg;

  final AppBar appBar = AppBar(
    iconTheme: IconThemeData(
      color: appColor.green,
    ),
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Text(
      "Sign Up",
      style: appTextStyle.bold18Green,
    ),
  );

  void didTapSignUpButton() async {
    await _service
        .createUser(
      email: emailController.text,
      password: passwordController.text,
    )
        .then((errorCode) {
      if (errorCode.isNotEmpty) {
        // NOTE: Show popup here
        errorMsg = errorCode;
        _showAlertDialog(errorMsg);
        print("error " + errorCode);
      } else {
        print("sign up success");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: deviceSize.height * .08),
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
                province(
                  appColor.darkGray,
                ),
                SizedBox(
                  height: 15,
                ),
                RoundButton(
                  AuthButtonType.signUp,
                  didTapSignUpButton,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  _showAlertDialog(errorMsg) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Login Failed',
              style: appTextStyle.regular15Green,
            ),
            content: Text(errorMsg!=null?errorMsg:'dummy'),
          );
        }
    );

  }
}
