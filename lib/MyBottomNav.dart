import 'package:flutter/material.dart';
import 'package:jbt/MapPageR.dart';
import 'package:jbt/Overview/OverviewScreen.dart';
import 'package:jbt/SettingsPage.dart';
import 'package:jbt/helper.dart';

class MyBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyBottomNavigationBar(),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    SettingsPage(),
    MapPageR(),
    OverviewScreen(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: appColor.green,
          onTap: onTappedBar,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: new Icon(Icons.settings), label: ("Setting")),
            BottomNavigationBarItem(icon: new Icon(Icons.map), label: ("Map")),
            BottomNavigationBarItem(
                icon: new Icon(Icons.info_outline), label: ("Overview")),
          ],
        ));
  }
}
