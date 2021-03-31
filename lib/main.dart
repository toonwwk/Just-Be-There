import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jbt/SignUp/SignUpScreen.dart';
import 'LogIn/LogInScreen.dart';
import 'dummy.dart';
import 'helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'JBT',
          // home: LogInScreen(),
          initialRoute: LogInScreen.routeName,

          routes: {
            LogInScreen.routeName: (ctx) => LogInScreen(),
            SignUpScreen.routeName: (ctx) => SignUpScreen(),
            MapController.routeName: (ctx) => MapController(),
          },

          onUnknownRoute: (settings) {
            return MaterialPageRoute(
              builder: (ctx) => LogInScreen(),
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
