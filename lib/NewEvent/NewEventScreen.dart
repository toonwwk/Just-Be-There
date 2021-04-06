import 'package:flutter/material.dart';
import 'package:jbt/Widgets/LeftIconTextField.dart';

import '../helper.dart';
import 'ImagePicker.dart';

class NewEventScreen extends StatelessWidget {
  static const routeName = '/new-event';

  final TextEditingController detailController = new TextEditingController();
  final TextEditingController telController = new TextEditingController();

  final AppBar appBar = AppBar(
    iconTheme: IconThemeData(
      color: appColor.lightGray,
    ),
    centerTitle: true,
    backgroundColor: appColor.green,
    title: Text(
      "New Event",
      style: appTextStyle.bold18Gray,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: appColor.lightGray,
        ),
        centerTitle: true,
        backgroundColor: appColor.green,
        title: Text(
          "New Event",
          style: appTextStyle.bold18Gray,
        ),
      ),
      body: Column(
        children: [
          ImagePicker(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LeftIconTextField(
                  TextFieldType.detail,
                  appColor.darkGray,
                  appColor.green,
                  detailController,
                ),
                SizedBox(
                  height: 20,
                ),
                LeftIconTextField(
                  TextFieldType.tel,
                  appColor.darkGray,
                  appColor.green,
                  telController,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
