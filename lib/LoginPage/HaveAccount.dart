import 'package:flutter/material.dart';
import 'package:jbt/helper.dart';

class GotoSignUp extends StatelessWidget{
  final bool login;
  final Function press;
  const GotoSignUp({
  Key key,
  this.login = true,
  this.press,
}): super(key: key);

  @override
  Widget build(BuildContext context){
  return Row(
  mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text('Do not have an account? ',style: appTextStyle.regular15Green,),
      GestureDetector(
      onTap: press,
      child: Text(
          'Sign Up',style: appTextStyle.semiBold15Orange,  ),
      )
    ],
  );
  }
}