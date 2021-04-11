import 'package:flutter/material.dart';
import 'package:jbt/Widgets/LeftIconTextField.dart';
import 'package:jbt/Widgets/DatePickerTextField.dart';

import '../helper.dart';
import 'ImagePicker.dart';

class NewEventScreen extends StatelessWidget {
  static const routeName = '/new-event';

  final TextEditingController detailController = new TextEditingController();
  final TextEditingController telController = new TextEditingController();
  final TextEditingController locationController = new TextEditingController();
  final TextEditingController dateController = new TextEditingController();

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
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        //enable or unable scroll
        //physics: const NeverScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            children: [
              ImagePicker(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LeftIconTextField(
                      TextFieldType.location,
                      appColor.darkGray,
                      appColor.green,
                      locationController,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    LeftIconTextField(
                      TextFieldType.detail,
                      appColor.darkGray,
                      appColor.green,
                      detailController,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    LeftIconTextField(
                      TextFieldType.tel,
                      appColor.darkGray,
                      appColor.green,
                      telController,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    DatePickerTextField(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
