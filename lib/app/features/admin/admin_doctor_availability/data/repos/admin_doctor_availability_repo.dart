import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_availability_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_availability/data/models/update_doctor_availability.dart';

abstract class AdminDoctorAvailabilityRepo {
  Future<Either<Failure, DoctorAvailabilityModel>> getDoctorAvailability(
    String doctorId,
  );

  Future<Either<Failure, DoctorAvailabilityModel>> updateDoctorAvailability({
    required String doctorId,
    required UpdateDoctorAvailabilityRequest request,
  });
}
