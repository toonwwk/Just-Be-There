import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jbt/helper.dart';
import 'package:flutter/services.dart';
import 'package:jbt/LoginPage/Login.dart';

final Box2 = BoxDecoration(
  borderRadius: BorderRadius.circular(10.0),
  border: Border.all(
    color: appColor.lightGray,
  ),
);


class SignUp extends StatelessWidget{

  Widget Username(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: <Widget>[
        SizedBox(height: 10,),
        Container(
          alignment: Alignment.centerLeft,
          decoration: Box2,
          width: 310,

          child: TextField(
            keyboardType: TextInputType.name,
            style: appTextStyle.regular15Gray,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.account_circle,
                color: appColor.lightGray,
              ),
              border:InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              hintText: 'username',
              hintStyle: appTextStyle.regular15Gray,
            ),
          ),
        )
      ],

    );
  }

  Widget Password(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: <Widget>[
        SizedBox(height: 10,),
        Container(
          alignment: Alignment.centerLeft,
          decoration: Box2,
          width: 310,

          child: TextField(
            keyboardType: TextInputType.name,
            style: appTextStyle.regular15Gray,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock,
                color: appColor.lightGray,
              ),
              border:InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              hintText: 'password',
              hintStyle: appTextStyle.regular15Gray,
            ),
          ),
        )
      ],

    );
  }
  Widget SignUpButt(){
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
          child: Text('Sign Up',style: appTextStyle.semiBold15White),

        )
    );
  }
  Widget ProvinceScroll(){

  }

  @override
  Widget build(BuildContext context) {
      // TODO: implement build

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: appColor.green, //change your color here
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text("Sign Up",style: appTextStyle.bold18Green,),

        ),


        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child:GestureDetector(
            onTap: () =>FocusScope.of(context).unfocus(),
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: size.height,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        SizedBox(height: size.height * .05),
                        Image(image: appAsset.icon,),
                        SizedBox(height: size.height * .05),
                        Username(),
                        SizedBox(height: size.height * .025),
                        Password(),
                        SizedBox(height: size.height * .025),
                        // ProvinceScroll(),
                        SizedBox(height: size.height * .05),
                        SignUpButt(),

                      ]
                  ),
                  )
                ],
              )
            )
        )

    );
    }
}