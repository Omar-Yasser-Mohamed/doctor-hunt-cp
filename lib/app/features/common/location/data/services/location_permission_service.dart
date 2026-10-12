import 'package:doctor_hunt/app/core/error/exceptions.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class LocationPermissionService {
  Future<void> ensurePermissionAndService();
}

@LazySingleton(as: LocationPermissionService)
class LocationPermissionServiceImpl implements LocationPermissionService {
  const LocationPermissionServiceImpl();

  @override
  Future<void> ensurePermissionAndService() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw const LocationServiceDisabledException();
    }

    var status = await Permission.location.status;
    if (status.isPermanentlyDenied) {
      throw const LocationPermissionPermanentlyDeniedException();
    }

    if (status.isDenied) {
      status = await Permission.location.request();
      if (status.isPermanentlyDenied) {
        throw const LocationPermissionPermanentlyDeniedException();
      }
      if (!status.isGranted) {
        throw const PermissionDeniedException(
          'Location permission was denied',
        );
      }
    }
  }
}
