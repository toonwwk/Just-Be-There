import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:jbt/Models/EventForm.dart';
import 'package:jbt/SearchPageF.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:provider/provider.dart';
import 'InfoWindowModel.dart';
import 'NewEvent/NewEventScreen.dart';
import 'Service/FirebaseService.dart';

class MapPageR extends StatefulWidget {
  final LatLng currentPosition;

  MapPageR({Key key, this.currentPosition}) : super(key: key);

  @override
  _MapPageRState createState() => _MapPageRState(this.currentPosition);
}

class _MapPageRState extends State<MapPageR> {
  LatLng currentPosition;
  _MapPageRState(this.currentPosition);
  DetailsResult detailsResult;
  GoogleMapController mapController;
  Set<Marker> _markers = Set<Marker>();
  final FirebaseService _service = FirebaseService();
  List<EventForm> _eventList = [];

  @override
  void initState() {
    super.initState();
  }

  void _didTapCreateEventButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewEventScreen(
            address, currentPosition.latitude, currentPosition.longitude),
      ),
    );
  }

  Future<void> fetchMakers() async {
    _eventList = await _service.fetchEventFromFirestore();
  }

  final double _infoWindowWidth = 250;
  final double _markerOffset = 170;
  String address = "Current location";
  var tmp;
  Marker marker;

  @override
  Widget build(BuildContext context) {
    final providerObject = Provider.of<InfoWindowModel>(context, listen: false);
    tmp = providerObject;
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

    return FutureBuilder(
      future: getCurrentLocation(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          EasyLoading.show(status: 'loading...');
          return Container();
        } else {
          EasyLoading.dismiss();
          return Scaffold(
            appBar: new AppBar(
              title: new Text("Maps"),
              actions: [
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      searchPlace(context);
                    })
              ],
            ),
            body: Stack(
              children: [
                Container(
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
                                                      Colors.grey,
                                                    ],
                                                    end: Alignment.bottomCenter,
                                                    begin: Alignment.topCenter,
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.blueGrey,
                                                        offset:
                                                            Offset(0.0, 1.0),
                                                        blurRadius: 6.0)
                                                  ]),
                                              height: 125,
                                              width: 250,
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Flexible(
                                                    flex: 1,
                                                    child: Text(
                                                      providerObject
                                                          .event.eventName,
                                                    ),
                                                  ),
                                                  Flexible(
                                                    flex: 3,
                                                    child: Text(
                                                      providerObject
                                                          .event.address,
                                                    ),
                                                  ),
                                                  Flexible(
                                                    flex: 1,
                                                    child: Text(
                                                      providerObject.event.tel
                                                          .toString(),
                                                    ),
                                                  ),
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
                        myLocationEnabled: true,
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
                          target: currentPosition,
                          zoom: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: _didTapCreateEventButton,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        }
      },
    );
  }

  void searchPlace(context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchPage()),
    );

    if (result.length > 0) {
      currentPosition = LatLng(result[0], result[1]);
      _getLocation(currentPosition);
      if (tmp.showInfoWindow) {
        tmp.updateVisibility(false);
        tmp.rebuildInfoWindow();
      }
    }
  }

  void _getLocation(coor) {
    var newPosition = CameraPosition(target: coor, zoom: 16);
    CameraUpdate update = CameraUpdate.newCameraPosition(newPosition);
    mapController.moveCamera(update);
  }

  Widget buildFloatingSearchBar() {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      hint: 'Search...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {},
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.place),
            onPressed: () {
              searchPlace(context);
            },
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return Container();
      },
    );
  }

  Future<LatLng> getCurrentLocation() async {
    final geoPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        forceAndroidLocationManager: true);
    currentPosition = LatLng(geoPosition.latitude, geoPosition.longitude);
    return currentPosition;
  }
}
