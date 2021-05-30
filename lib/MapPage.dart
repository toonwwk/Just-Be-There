import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jbt/Models/EventForm.dart';
import 'package:jbt/Service/FirebaseService.dart';
import 'package:provider/provider.dart';

import 'InfoWindowModel.dart';
import 'model/event.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController mapController;
  Set<Marker> _markers = Set<Marker>();

  // final Map<String, Event> _eventList = {
  //   "event1": Event('CovidParty', LatLng(13.756331, 100.501762), 'Details',
  //       'click to jump'),
  // "event2": Event('CovidParty2', LatLng(13.784280, 100.599937), 'Details2',
  //       'click to jump2')
  // };

  List<EventForm> _eventList = [];

  final double _infoWindowWidth = 250;
  final double _markerOffset = 170;
  final FirebaseService _service = FirebaseService();

  Future<void> fetchMakers() async {
    _eventList = await _service.fetchEventFromFirestore();
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId("id-1"),
          position: LatLng(13.756331, 100.501762),
          infoWindow: InfoWindow(
              title: 'Cartoon Home', snippet: 'This is where Cartoon live'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final providerObject = Provider.of<InfoWindowModel>(context, listen: false);
    print('----------- Here ------------');
    fetchMakers().then((value) {
      print(_eventList.length);
      print(_eventList.elementAt(0).lat);
      _eventList.forEach((event) {
        _markers.add(Marker(
            markerId: MarkerId(event.eventName),
            position: LatLng(event.lat, event.long),
            onTap: () {
              providerObject.updateInfo(
                  context,
                  mapController,
                  LatLng(event.lat, event.long),
                  _infoWindowWidth,
                  _markerOffset);
              providerObject.updateEvent(event);
              providerObject.updateVisibility(true);
              providerObject.rebuildInfoWindow();
            }));
      });
    });
    // Marker(
    //   markerId: MarkerId("id-1"),
    //   position: LatLng(13.756331, 100.501762),
    //   infoWindow: InfoWindow(
    //       title: 'Cartoon Home', snippet: 'This is where Cartoon live'),
    // ),
    ;
    return Scaffold(
        appBar: new AppBar(
          title: new Text("GoogleMaps"),
        ),
        body: Container(
          child: Consumer<InfoWindowModel>(
            builder: (context, model, child) {
              return Stack(
                children: [
                  child,
                  Positioned(
                      left: 0,
                      top: 0,
                      child: Visibility(
                        visible: providerObject.showInfoWindow,
                        child: (providerObject.event == null ||
                                !providerObject.showInfoWindow)
                            ? Container()
                            : Container(
                                margin: EdgeInsets.only(
                                    left: providerObject.leftMargin,
                                    top: providerObject.topMargin),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.white,
                                              Colors.blueAccent,
                                            ],
                                            end: Alignment.bottomCenter,
                                            begin: Alignment.topCenter,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.green,
                                                offset: Offset(0.0, 1.0),
                                                blurRadius: 6.0)
                                          ]),
                                      height: 115,
                                      width: 250,
                                      padding: EdgeInsets.all(15),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            children: [
                                              Text(providerObject
                                                  .event.eventName),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                      ))
                ],
              );
            },
            child: Positioned(
              child: GoogleMap(
                onTap: (position) {
                  if (providerObject.showInfoWindow) {
                    providerObject.updateVisibility(false);
                    providerObject.rebuildInfoWindow();
                  }
                },
                onCameraMove: (position) {
                  if (providerObject.event != null) {
                    providerObject.updateInfo(
                        context,
                        mapController,
                        LatLng(providerObject.event.lat,
                            providerObject.event.long),
                        _infoWindowWidth,
                        _markerOffset);
                    providerObject.rebuildInfoWindow();
                  }
                },
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                },
                markers: _markers,
                initialCameraPosition: CameraPosition(
                  target: LatLng(13.756331, 100.501762),
                  zoom: 15,
                ),
              ),
            ),
          ),
        ));
  }
}

//https://www.youtube.com/watch?v=gTHKFRRSPss&t=537s infowindow normal
//https://console.cloud.google.com/apis/credentials?folder=&organizationId=&project=just-be-there-307718&supportedpurview=project generate API KEY
//https://www.youtube.com/watch?v=0048xewPoxo infowindow on click
