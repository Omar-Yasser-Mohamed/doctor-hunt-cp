import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';

import 'location_permission_service.dart';

abstract class GpsService {
  Future<LatLng> getCurrentPosition();
}

@LazySingleton(as: GpsService)
class GpsServiceImpl implements GpsService {
  const GpsServiceImpl(this._permissionService);

  final LocationPermissionService _permissionService;

  @override
  Future<LatLng> getCurrentPosition() async {
    await _permissionService.ensurePermissionAndService();

    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );

    return LatLng(position.latitude, position.longitude);
  }
}
