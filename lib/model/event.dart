import 'package:google_maps_flutter/google_maps_flutter.dart';

class Event {
  final String eventName;
  final LatLng location;
  final String detail;
  final String link;

  Event(this.eventName, this.location, this.detail, this.link);
}
