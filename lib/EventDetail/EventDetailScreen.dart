import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jbt/Models/EventForm.dart';
import '../helper.dart';

class EventDetailScreen extends StatelessWidget {
  EventForm _event;

  EventDetailScreen(this._event);

  Widget _buildHorizontalImageListView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _event.urlList.length,
      itemBuilder: (context, i) {
        return Container(
          padding: EdgeInsets.all(20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FittedBox(
              child: Image.network(
                _event.urlList[i],
              ),
              fit: BoxFit.fill,
            ),
          ),
        );
      },
    );
  }

  Widget displayImages() {
    switch (_event.urlList.length) {
      case 0:
        return Container();
      case 1:
        return Center(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FittedBox(
                child: Image.network(
                  _event.urlList[0],
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      default:
        return _buildHorizontalImageListView();
    }
  }

  OutlineInputBorder get border {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
  }

  Widget _display(String text, IconData _icon) {
    return text != "" && text != null
        ? SizedBox(
            child: TextField(
              style: appTextStyle.regular15Green,
              maxLines: null,
              readOnly: true,
              decoration: InputDecoration(
                enabledBorder: border,
                focusedBorder: border,
                prefixIcon: Icon(
                  _icon,
                  color: appColor.green,
                ),
                // hintText: text,
                hintText: text,
                hintMaxLines: 200,
                alignLabelWithHint: true,
                hintStyle: appTextStyle.regular15Green,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 13,
                ),
              ),
            ),
          )
        : Container();
  }

  String get date {
    if (_event.startDate != null && _event.endDate != null)
      return _event.startDate + ' - ' + _event.endDate;
    return "";
  }

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
          _event.eventName,
          style: appTextStyle.bold18Gray,
        ),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: appColor.yellow,
                ),
                height: _event.urlList.length == 0 ? 0 : 200,
                child: displayImages(),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(children: [
                  _display(_event.eventName, Icons.title),
                  _display(_event.address, Icons.location_on),
                  _display(_event.description, Icons.info_outline_rounded),
                  _display(date, Icons.date_range),
                  _display(_event.tel, Icons.local_phone),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
