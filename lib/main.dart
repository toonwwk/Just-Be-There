import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jbt/SignUp/SignUpScreen.dart';

import 'LogIn/LogInScreen.dart';
import 'NewEvent/NewEventScreen.dart';
import 'dummy.dart';
import 'package:jbt/helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        return MaterialApp(
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
            MapController.routeName: (ctx) => MapController(),
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

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider.value(
//           value: AuthenticationProvider(),
//         ),
//         // ChangeNotifierProxyProvider<Auth, Products>(
//         //   builder: (ctx, auth, previousProducts) => Products(
//         //         auth.token,
//         //         auth.userId,
//         //         previousProducts == null ? [] : previousProducts.items,
//         //       ),
//         // ),
//       ],
//       child: Consumer<AuthenticationProvider>(

//       ),
//     );
//   }
// }
