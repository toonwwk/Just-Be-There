import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jbt/LogIn/Widget/LogInTextField.dart';
import 'package:jbt/helper.dart';
import 'package:flutter/services.dart';
import 'package:jbt/LogIn/Widget/SignUpText.dart';
import 'package:jbt/SignUp/SignUpScreen.dart';

final Box = BoxDecoration(
  border: Border.all(
    color: appColor.green,
  ),
);

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  Widget Username() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: Box,
          width: 310,
          child: TextField(
            keyboardType: TextInputType.name,
            style: appTextStyle.bold15Green,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.account_circle,
                color: appColor.green,
              ),
              border: InputBorder.none,
              hintText: 'Username',
              hintStyle: appTextStyle.bold15Green,
            ),
          ),
        )
      ],
    );
  }

  Widget Password() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: Box,
          width: 310,
          child: TextField(
            keyboardType: TextInputType.name,
            style: appTextStyle.bold15Green,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock,
                color: appColor.green,
              ),
              border: InputBorder.none,
              hintText: 'Password',
              hintStyle: appTextStyle.bold15Green,
            ),
          ),
        )
      ],
    );
  }

  Widget LoginButt() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        width: 250,
        child: RaisedButton(
          elevation: 10,
          onPressed: () => print('Login'),
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: appColor.orange,
          child: Text('Sign In', style: appTextStyle.semiBold15White),
        ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Stack(
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        height: size.height,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: size.height * .12),
                              Image(
                                image: appAsset.icon,
                              ),
                              Text('JUST BE THERE',
                                  style: appTextStyle.bold18Green),
                              SizedBox(
                                height: size.height * .05,
                              ),
                              // Username(),
                              // SizedBox(height: size.height * .025),
                              // Password(),
                              // SizedBox(height: size.height * .05),
                              LogInTextField(LogInTextFieldType.username),
                              LogInTextField(LogInTextFieldType.password),
                              LoginButt(),
                              SizedBox(
                                  height: size.height * .1), //pos of SignUp
                              SignUpText(
                                press: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return SignUp();
                                      },
                                    ),
                                  );
                                },
                              )
                            ]))
                  ],
                ))));
  }
}
