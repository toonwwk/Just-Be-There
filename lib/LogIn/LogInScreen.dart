import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jbt/Service/FirebaseService.dart';
import 'package:jbt/Widgets/Authentication/AuthTextField.dart';
import 'package:jbt/Widgets/Authentication/AuthButton.dart';
import 'package:jbt/Widgets/Authentication/ErrorPopup.dart';
import 'package:jbt/helper.dart';
import 'package:jbt/Widgets/Authentication/SignUpText.dart';

class LogInScreen extends StatelessWidget {
  static const routeName = '/login';
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final FirebaseService _service = FirebaseService();

  void didTapLogInButton() async {
    await _service
        .signIn(
      email: emailController.text,
      password: passwordController.text,
    )
        .then((errorCode) {
      if (errorCode.isNotEmpty) {
        // NOTE: Show popup here
        // ErrorPopup(
        //   errorCode,
        // );
        if(emailController.text.isEmpty){
          ErrorPopup('ERROR_INVALID_EMAIL');
        }
        if(passwordController.text != 0){
          ErrorPopup('ERROR_WRONG_PASSWORD');
        }

        print("error " + errorCode);
      } else {
        print("login success");
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
                AuthTextField(
                  TextFieldType.email,
                  appColor.green,
                  emailController,
                ),
                SizedBox(
                  height: 15,
                ),
                AuthTextField(
                  TextFieldType.password,
                  appColor.green,
                  passwordController,
                ),
                SizedBox(
                  height: 15,
                ),
                AuthButton(
                  AuthButtonType.logIn,
                  didTapLogInButton,
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
