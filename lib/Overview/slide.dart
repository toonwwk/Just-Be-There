import 'package:flutter/cupertino.dart';
import '../helper.dart';

class Slide{
  String _image;
  String _title;
  String _detail;

  Slide({String image,String title, String detail}){
    this._image = image;
    this._title = title;
    this._detail = detail;
  }

  String get image => _image;
  setImage(String value){
    _image = value;
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
  Slide slide = new Slide();

  slide.setImage("assets/map2orange.png");
  slide.setTitle("Choose the place");
  slide.setDetail("Pick the place on the map where you want to start your event.");
  slides.add(slide);

  slide = new Slide();

  slide.setImage("assets/noteOrange.png");
  slide.setTitle("Set up an event");
  slide.setDetail("Write down the details about the event that you want to start at that place.");
  slides.add(slide);

  slide = new Slide();

  slide.setImage("assets/adminOrange.png");
  slide.setTitle("Wait for confirmation");
  slide.setDetail("The app will send the event details to the admin for confirmation.");
  slides.add(slide);

  slide = new Slide();

  slide.setImage("assets/eventOrange.png");
  slide.setTitle("Done!");
  slide.setDetail("Your event will show on the map for everyone to see, and come.");
  slides.add(slide);

  slide = new Slide();

  return slides;
}

class Tile extends StatelessWidget {

  String image;
  String title;
  String detail;

  Tile({this.image,this.title,this.detail});
  //Tile({this.title,this.detail});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(image,height: 150,),
          SizedBox(height: 50),
          Text(title,style: appTextStyle.bold18Green),
          SizedBox(height:20),
          Text(detail,style: appTextStyle.regular13Green),
        ],
      ),
    );
  }

}