import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jbt/Service/FirebaseService.dart';
import 'package:jbt/Widgets/Authentication/AuthTextField.dart';
import 'package:jbt/Widgets/Authentication/AuthButton.dart';
import 'package:jbt/helper.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/signup';
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final FirebaseService _service = FirebaseService();

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
                AuthTextField(
                  TextFieldType.email,
                  appColor.darkGray,
                  emailController,
                ),
                SizedBox(
                  height: 15,
                ),
                AuthTextField(
                  TextFieldType.password,
                  appColor.darkGray,
                  passwordController,
                ),
                SizedBox(
                  height: 15,
                ),
                AuthButton(
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
}
