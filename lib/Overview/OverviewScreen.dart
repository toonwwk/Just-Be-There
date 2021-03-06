import 'package:flutter/material.dart';
import 'package:jbt/Overview/slide.dart';
import '../helper.dart';
import 'dart:io';

class OverviewScreen extends StatefulWidget {
  @override
  OverviewScreenState createState() => OverviewScreenState();
}

class OverviewScreenState extends State<OverviewScreen> {
  static const routeName = '/overview';
  List<Slide> slides = [];
  final PageController _pageController = PageController(initialPage: 0);
  int current = 0;

  @override
  void initState() {
    super.initState();
    slides = getSlide();
  }

  Widget indicator(bool current) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: current ? 10 : 6,
      width: current ? 10 : 6,
      decoration: BoxDecoration(
        color: current ? appColor.green : appColor.lightGray,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: appColor.lightGray,
        ),
        centerTitle: true,
        backgroundColor: appColor.green,
        title: Text(
          "Overview",
          style: appTextStyle.bold18Gray,
        ),
      ),
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (val) {
          setState(() {
            current = val;
          });
        },
        itemBuilder: (context, index) {
          return Tile(
            image: slides[index].image,
            title: slides[index].title,
            detail: slides[index].detail,
          );
        },
        itemCount: slides.length,
      ),
      bottomSheet: Container(
        height: deviceSize.height * 0.05,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  current - 1,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.linear,
                );
              },
              child: Text(
                "PREV",
                style: appTextStyle.regular13Green,
              ),
            ),
            Row(
              children: <Widget>[
                for (int i = 0; i < slides.length; i++)
                  current == i ? indicator(true) : indicator(false)
              ],
            ),
            GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  current + 1,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.linear,
                );
              },
              child: Text(
                "NEXT",
                style: appTextStyle.regular13Green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
