import 'dart:io';

import 'package:dio/dio.dart';

class Places {
  final String placeId, business_status, geometry, name, vicinity;

  Places(
      {this.placeId,
      this.business_status,
      this.geometry,
      this.name,
      this.vicinity});
  static Places fromJson(Map<String, dynamic> json) {
    return Places(
      placeId: json['place_id'],
      business_status: json['business_status'],
      geometry: json['geometry'],
      name: json['name'],
      vicinity: json['vicinity'],
    );
  }
}

class NearbySearchApi {
  NearbySearchApi._internal();
  static NearbySearchApi get instance => NearbySearchApi._internal();
  final Dio _dio = Dio();

  static final String androidKey = 'AIzaSyA7B8GU2iS0g0sLaiwgdbpo0hJ0GKBPSRQ';
  static final String iosKey = 'AIzaSyA7B8GU2iS0g0sLaiwgdbpo0hJ0GKBPSRQ';
  final apiKey = Platform.isAndroid ? androidKey : iosKey;

  Future<List<Places>> searchNearbyPlaces(String input) async {
    try {
      print(input);
      final response = await this._dio.get(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json',
        queryParameters: {
          // "types": "address",
          "location":
              "13.7478586,100.5653082", //This should be the users location
          "radius": 5000, //5km radius
          "keyword": input,
          "key": apiKey,
        },
      );
      final List<Places> places = (response.data['results'] as List)
          .map((item) => Places.fromJson(item))
          .toList();

      final places2 = response.data['results']
          .map<String>((result) => result['name'].toString())
          .toList();
      print(places2 + " places2");
      print("Places.length" + places[0].name);
      print("Tried in try catch");
      return places;
    } catch (e) {
      print("Catch in try catch");
      return null;
    }
  }
}
