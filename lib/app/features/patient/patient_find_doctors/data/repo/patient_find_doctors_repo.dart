import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';

abstract class PatientFindDoctorsRepo {
  Future<Either<Failure, List<DoctorModel>>> searchForDoctors({
    required String query,
    int page = 1,
    int limit = 10,
  });
}
