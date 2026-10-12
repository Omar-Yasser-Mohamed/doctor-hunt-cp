import 'dart:convert';

import 'package:doctor_hunt/app/core/constants/maps_constants.dart';
import 'package:doctor_hunt/app/core/error/exceptions.dart';
import 'package:doctor_hunt/app/features/common/location/data/models/location_model.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class LocationService {
  Future<String> getAddressFromCoordinates(double lat, double lng);
  Future<List<LocationModel>> searchPlaces(String query);
}

@LazySingleton(as: LocationService)
class LocationServiceImpl implements LocationService {
  const LocationServiceImpl();

  static const Map<String, String> _headers = {
    'User-Agent': MapsConstants.userAgent,
  };

  @override
  Future<String> getAddressFromCoordinates(double lat, double lng) async {
    final uri = MapsConstants.reverseGeocodingUri(lat: lat, lng: lng);
    final response = await http.get(uri, headers: _headers);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final displayName = data['display_name'] as String?;
      if (displayName != null && displayName.isNotEmpty) {
        return displayName;
      }
    }

    throw const GeocodingException();
  }

  @override
  Future<List<LocationModel>> searchPlaces(String query) async {
    final uri = MapsConstants.searchPlacesUri(query: query);
    final response = await http.get(uri, headers: _headers);

    if (response.statusCode == 200) {
      final list = jsonDecode(response.body) as List<dynamic>;
      return list.map((item) {
        final lat = double.parse(item['lat'] as String);
        final lon = double.parse(item['lon'] as String);
        final name = (item['display_name'] as String?) ?? '';
        return LocationModel(latitude: lat, longitude: lon, address: name);
      }).toList();
    }

    throw const GeocodingException();
  }
}
