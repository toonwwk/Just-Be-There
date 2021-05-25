import 'package:flutter/cupertino.dart';

class Slide{
  String _title;
  String _detail;

  Slide({String title, String detail}){
    this._title = title;
    this._detail = detail;
  }
  String get title => _title;
  setTitle(String value){
    _title = value;
  }

  String get detail => _detail;
  setDetail(String value){
    _detail = value;
  }
}
List<Slide> getSlide(){
  List<Slide> slides = [];
}

class Tile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}