import 'package:doctor_hunt/app/core/error/error_handler.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_availability_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_availability/data/models/update_doctor_availability.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_availability/data/repos/admin_doctor_availability_repo.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_availability/data/services/admin_doctor_availability_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AdminDoctorAvailabilityRepo)
class AdminDoctorAvailabilityRepoImpl implements AdminDoctorAvailabilityRepo {
  const AdminDoctorAvailabilityRepoImpl(this._service);

  final AdminDoctorAvailabilityService _service;

  @override
  Future<Either<Failure, DoctorAvailabilityModel>> getDoctorAvailability(
    String doctorId,
  ) async {
    try {
      final result = await _service.getDoctorAvailability(doctorId);
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, DoctorAvailabilityModel>> updateDoctorAvailability({
    required String doctorId,
    required UpdateDoctorAvailabilityRequest request,
  }) async {
    try {
      final result = await _service.updateDoctorAvailability(
        doctorId: doctorId,
        request: request,
      );
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
