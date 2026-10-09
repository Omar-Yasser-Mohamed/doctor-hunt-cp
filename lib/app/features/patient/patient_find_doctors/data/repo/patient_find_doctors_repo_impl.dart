import 'package:doctor_hunt/app/core/error/error_handler.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/patient/patient_find_doctors/data/repo/patient_find_doctors_repo.dart';
import 'package:doctor_hunt/app/features/patient/patient_find_doctors/data/service/patient_find_doctors_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PatientFindDoctorsRepo)
class PatientFindDoctorsRepoImpl implements PatientFindDoctorsRepo {
  PatientFindDoctorsRepoImpl(this._service);
  final PatientFindDoctorsService _service;

  @override
  Future<Either<Failure, List<DoctorModel>>> searchForDoctors({
    required String query,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final result = await _service.searchForDoctors(
        query: query,
        page: page,
        limit: limit,
      );
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
