import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:jbt/Service/FirebaseService.dart';
import 'package:jbt/Widgets/LeftIconTextField.dart';
import 'package:jbt/Widgets/DatePickerTextField.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import '../helper.dart';
import 'ImagePicker.dart';
// import 'package:path_provider/path_provider.dart';
// Future<File> getImageFileFromAssets(String path) async {
//   final byteData = await rootBundle.load('assets/$path');

//   final file = File('${(await getTemporaryDirectory()).path}/$path');
//   await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

//   return file;
// }

class NewEventScreen extends StatelessWidget {
  static const routeName = '/new-event';

  final TextEditingController detailController = new TextEditingController();
  final TextEditingController telController = new TextEditingController();
  final TextEditingController locationController = new TextEditingController();
  final TextEditingController dateController = new TextEditingController();
  final TextEditingController titleController = new TextEditingController();
  final FirebaseService _service = FirebaseService();

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

  List<Asset> images = <Asset>[];

  void didSelectImages(List<Asset> images) {
    this.images = images;
  }

  Future<void> didPressSubmitButton() async {
    _service.uploadImage(images, titleController.text);
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            children: [
              ImagePicker(didSelectImages: didSelectImages),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LeftIconTextField(
                      TextFieldType.eventTitle,
                      appColor.darkGray,
                      appColor.green,
                      titleController,
                    ),
                    SizedBox(
                      height: 15,
                    ),
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
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => didPressSubmitButton(),
                        style: ElevatedButton.styleFrom(
                          primary: appColor.green,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                        ),
                        child:
                            Text("Submit", style: appTextStyle.semiBold15White),
                      ),
                    ),
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
