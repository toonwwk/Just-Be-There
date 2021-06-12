import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jbt/SignUp/SignUpScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LogIn/LogInScreen.dart';
import 'NewEvent/NewEventScreen.dart';
import 'package:jbt/helper.dart';

SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  runApp(MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        return MaterialApp(
          builder: EasyLoading.init(),
          theme: new ThemeData(
            primaryColor: appColor.green,
            primarySwatch: Colors.teal,
          ),
          title: 'JBT',
          // home: LogInScreen(),
          initialRoute: LogInScreen.routeName,

          routes: {
            LogInScreen.routeName: (ctx) => UserLoginScreen(),
            SignUpScreen.routeName: (ctx) => UserSignUpScreen(),
            NewEventScreen.routeName: (ctx) => NewEventScreen(),
          },
          onUnknownRoute: (settings) {
            return MaterialPageRoute(
              builder: (ctx) => UserLoginScreen(),
            );
          },
        );
      },
    );
  }
}
