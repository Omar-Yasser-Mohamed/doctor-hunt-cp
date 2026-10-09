import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';

abstract class PatientDoctorDetailsRepo {
  Future<Either<Failure, DoctorModel>> getDoctorDetails({
    required String doctorId,
  });
}
