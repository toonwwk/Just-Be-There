import 'dart:io';

import 'package:dio/dio.dart';

// class Place {
//   final String placeId, description;
//
//   Place({this.placeId, this.description});
//   static Place fromJson(Map<String, dynamic> json) {
//     return Place(
//       placeId: json['placeId'],
//       description: json['description'],
//     );
//   }
// }

class Places {
  final String placeId, formatted_address, geometry, name;

  Places({
    this.placeId,
    this.formatted_address,
    this.geometry,
    this.name,
  });
  static Places fromJson(Map<String, dynamic> json) {
    return Places(
      placeId: json['placeId'],
      formatted_address: json['description'],
      geometry: json['geometry'],
      name: json['name'],
    );
  }
}

class PlaceApi {
  PlaceApi._internal();
  static PlaceApi get instance => PlaceApi._internal();
  final Dio _dio = Dio();

  static final String androidKey = 'AIzaSyA7B8GU2iS0g0sLaiwgdbpo0hJ0GKBPSRQ';
  static final String iosKey = 'AIzaSyA7B8GU2iS0g0sLaiwgdbpo0hJ0GKBPSRQ';
  final apiKey = Platform.isAndroid ? androidKey : iosKey;

  Future<List<Places>> searchPredictions(String input) async {
    try {
      final response = await this._dio.get(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json',
        queryParameters: {
          "input": input,
          "key": apiKey,
          "types": "address",
          "language": "en",
          "components": "country:TH",
          "radius": 5000, //5km radius
          "location": "13.820640,99.875360", //This should be the users location
        },
      );
      // print(response.data);
      final List<Places> places = (response.data['results'] as List)
          .map((item) => Places.fromJson(item))
          .toList();
      return places;
    } catch (e) {
      return null;
    }
  }
}
