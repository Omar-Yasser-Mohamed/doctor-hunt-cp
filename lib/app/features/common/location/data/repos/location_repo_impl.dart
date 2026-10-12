import 'package:doctor_hunt/app/core/error/error_handler.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/common/location/data/models/location_model.dart';
import 'package:doctor_hunt/app/features/common/location/data/repos/location_repo.dart';
import 'package:doctor_hunt/app/features/common/location/data/services/gps_service.dart';
import 'package:doctor_hunt/app/features/common/location/data/services/location_service.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';

@LazySingleton(as: LocationRepo)
class LocationRepoImpl implements LocationRepo {
  LocationRepoImpl(this._gpsService, this._locationService);

  final GpsService _gpsService;
  final LocationService _locationService;

  @override
  Future<Either<Failure, LatLng>> getCurrentPosition() async {
    try {
      final position = await _gpsService.getCurrentPosition();
      return Right(position);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, String>> getAddressFromCoordinates(
    double lat,
    double lng,
  ) async {
    try {
      final address = await _locationService.getAddressFromCoordinates(lat, lng);
      return Right(address);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<LocationModel>>> searchPlaces(
    String query,
  ) async {
    try {
      final places = await _locationService.searchPlaces(query);
      return Right(places);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
