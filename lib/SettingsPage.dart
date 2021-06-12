import 'package:flutter/material.dart';
import 'package:jbt/LogIn/LogInScreen.dart';
import 'Service/FirebaseService.dart';
import 'helper.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  static const routeName = '/setting';
  FirebaseService _service = FirebaseService();

  void didTapSignOutButton() {
    _service.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserLoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: appColor.lightGray,
          ),
          centerTitle: true,
          backgroundColor: appColor.green,
          title: Text(
            "Setting",
            style: appTextStyle.bold18Gray,
          ),
        ),
        body: new Align(
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width - 100,
              maxHeight: 40,
            ),
            child: ElevatedButton(
              onPressed: () => didTapSignOutButton(),
              style: ElevatedButton.styleFrom(
                primary: appColor.orange,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                ),
              ),
              child: Text("Sign Out", style: appTextStyle.semiBold15White),
            ),
          ),
        ));
  }
}
