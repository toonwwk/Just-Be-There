import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jbt/Providers/Authen.dart';
import 'package:jbt/Widgets/Authentication/AuthTextField.dart';
import 'package:jbt/Widgets/Authentication/AuthButton.dart';
import 'package:jbt/helper.dart';
import 'package:jbt/Widgets/Authentication/SignUpText.dart';

class LogInScreen extends StatelessWidget {
  static const routeName = '/login';
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final AuthenticationProvider _service = AuthenticationProvider();

  Function didTapLogInButton() {
    print("Creating user");
    print("email " + emailController.text);
    _service.createUser(
        email: emailController.text, password: passwordController.text);
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

// class LogInScreen extends StatefulWidget {
//   static const routeName = '/login';
//   @override
//   LogInScreenState createState() => LogInScreenState();
// // }

// class LogInScreenState extends State<LogInScreen> {
//   @override
//   Widget build(BuildContext context) {
//     Size deviceSize = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SingleChildScrollView(
//         physics: NeverScrollableScrollPhysics(),
//         child: ConstrainedBox(
//           constraints: BoxConstraints(
//             minWidth: MediaQuery.of(context).size.width,
//             minHeight: MediaQuery.of(context).size.height,
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 20,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 SizedBox(height: deviceSize.height * .1),
//                 Image(
//                   image: appAsset.icon,
//                   width: 190,
//                   height: 138,
//                 ),
//                 SizedBox(
//                   height: 25,
//                 ),
//                 Text(
//                   'JUST BE THERE',
//                   style: appTextStyle.bold18Green,
//                 ),
//                 SizedBox(
//                   height: 50,
//                 ),
//                 AuthTextField(
//                   TextFieldType.email,
//                   appColor.green,
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 AuthTextField(
//                   TextFieldType.password,
//                   appColor.green,
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 RoundButton(
//                   "Log In",
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 SignUpText(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
