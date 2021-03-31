import 'dart:async';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class ImagePicker extends StatefulWidget {
  @override
  _ImagePicker createState() => _ImagePicker();
}

class _ImagePicker extends State<ImagePicker> {
  List<Asset> images = <Asset>[];

  Widget buildHorizontalImageListView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: images.length,
      itemBuilder: (context, i) {
        Asset asset = images[i];
        return Container(
          padding: EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: AssetThumb(
              asset: asset,
              width: 180,
              height: 180,
            ),
          ),
        );
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
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      print("Error picking images : " + e.toString());
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            child: buildHorizontalImageListView(),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: loadAssets,
            child: Text("Add images"),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
