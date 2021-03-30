import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId("id-1"), position: LatLng(13.756331, 100.501762)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("GoogleMaps"),
        ),
        body: GoogleMap(
            onMapCreated: _onMapCreated,
            markers: _markers,
            initialCameraPosition: CameraPosition(
              target: LatLng(13.756331, 100.501762),
              zoom: 15,
            )));
  }
}

//https://www.youtube.com/watch?v=gTHKFRRSPss&t=537s infowindow normal
//https://console.cloud.google.com/apis/credentials?folder=&organizationId=&project=just-be-there-307718&supportedpurview=project generate API KEY
//https://www.youtube.com/watch?v=0048xewPoxo infowindow on click
