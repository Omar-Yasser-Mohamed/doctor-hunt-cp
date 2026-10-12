import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/common/location/data/models/location_model.dart';
import 'package:latlong2/latlong.dart';

abstract class LocationRepo {
  Future<Either<Failure, LatLng>> getCurrentPosition();
  Future<Either<Failure, String>> getAddressFromCoordinates(double lat, double lng);
  Future<Either<Failure, List<LocationModel>>> searchPlaces(String query);
}
