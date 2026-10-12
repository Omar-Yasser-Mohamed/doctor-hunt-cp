abstract final class MapsConstants {
  static const String userAgent = 'doctor_hunt/1.0';
  static const String userAgentPackageName = 'doctor_hunt';

  // Tile Layer
  static const String openStreetMapTileUrl =
      'https://tile.openstreetmap.org/{z}/{x}/{y}.png';

  // Nominatim OpenStreetMap API
  static const String nominatimBaseUrl = 'https://nominatim.openstreetmap.org';
  static const String nominatimReverseEndpoint = '/reverse';
  static const String nominatimSearchEndpoint = '/search';

  static Uri reverseGeocodingUri({
    required double lat,
    required double lng,
  }) {
    return Uri.parse(
      '$nominatimBaseUrl$nominatimReverseEndpoint?lat=$lat&lon=$lng&format=json',
    );
  }

  static Uri searchPlacesUri({
    required String query,
    int limit = 5,
  }) {
    final encodedQuery = Uri.encodeComponent(query);
    return Uri.parse(
      '$nominatimBaseUrl$nominatimSearchEndpoint?q=$encodedQuery&format=json&limit=$limit',
    );
  }
}
