import 'package:flutter/material.dart';
import 'package:jbt/Models/EventForm.dart';
import 'package:jbt/Service/FirebaseService.dart';
import 'package:jbt/Widgets/LeftIconTextField.dart';
import 'package:jbt/Widgets/DatePickerTextField.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import '../helper.dart';
import 'ImagePicker.dart';

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
  String startDate;
  String endDate;
  String address;
  double lat;
  double long;

  NewEventScreen(this.address, this.lat, this.long);

  void didSelectImages(List<Asset> images) {
    this.images = images;
  }

  void didSelectDateRange(String startDate, String endDate) {
    this.startDate = startDate;
    this.endDate = endDate;
  }

  Future<void> didPressSubmitButton() async {
    int i = 0;
    List<String> imageUrlList = [];

    await Future.forEach(images, (image) async {
      await _service
          .uploadImageToStorage(image, titleController.text, i.toString())
          .then((value) {
        print(value);
        imageUrlList.add(value);
      });
    });

    EventForm form = EventForm(
      titleController.text,
      address,
      detailController.text,
      startDate,
      endDate,
      telController.text,
      lat,
      long,
      imageUrlList,
    );

    Future<bool> result = _service.uploadFormToFireStore(form);
    result.then((value) {
      print(value.toString());
      print("sucess");
    }).catchError((onError) {
      print("error uploading form");
    });
  }

  @override
  Widget build(BuildContext context) {
    locationController.text = address;
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
                    DatePickerTextField(didSelectDateRange: didSelectDateRange),
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
