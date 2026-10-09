import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/params/doctors_filter.dart';

abstract class PatientHomeRepo {
  Future<Either<Failure, List<DoctorModel>>> getDoctors({
    required int page,
    required int limit,
    required DoctorsFilter filter,
  });
}
