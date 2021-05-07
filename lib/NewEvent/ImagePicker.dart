import 'dart:async';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import '../helper.dart';

// ignore: must_be_immutable
class ImagePicker extends StatefulWidget {
  final Function didSelectImages;

  ImagePicker({Key key, this.didSelectImages}) : super(key: key);

  @override
  _ImagePicker createState() => _ImagePicker();
}

class _ImagePicker extends State<ImagePicker> {
  List<Asset> images = <Asset>[];

  Widget blankImage() {
    return InkWell(
      onTap: loadAssets,
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: Image(
          image: appAsset.imagePicker,
          height: 140,
          width: 140,
        ),
      ),
    );
  }

  Widget selectedImage(Asset asset) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: AssetThumb(
          asset: asset,
          width: 140,
          height: 140,
        ),
      ),
    );
  }

  Widget buildHorizontalImageListView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: images.length + 1,
      itemBuilder: (context, i) {
        try {
          Asset asset = images[i];
          return selectedImage(asset);
        } catch (error) {
          return blankImage();
        }
      },
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 10,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#FF314E52",
          actionBarTitle: "JBT",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#FF314E52",
        ),
      );
    } on Exception catch (e) {
      print("Error picking images : " + e.toString());
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
      widget.didSelectImages(images);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 233,
      width: double.infinity,
      color: appColor.yellow,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 150,
            child: images.length == 0
                ? blankImage()
                : buildHorizontalImageListView(),
          ),
          SizedBox(
            height: 5,
          ),
          ButtonTheme(
            minWidth: 100,
            height: 20,
            child: ElevatedButton(
              onPressed: loadAssets,
              style: ElevatedButton.styleFrom(
                primary: appColor.orange,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
              ),
              child: Text("Add images", style: appTextStyle.semiBold15White),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
