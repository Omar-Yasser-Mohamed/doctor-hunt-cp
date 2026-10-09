import 'package:doctor_hunt/app/core/error/error_handler.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/data/repos/patient_home_repo.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/data/services/patient_home_service.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/params/doctors_filter.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PatientHomeRepo)
class PatientHomeRepoImpl implements PatientHomeRepo {
  const PatientHomeRepoImpl(this._service);

  final PatientHomeService _service;

  @override
  Future<Either<Failure, List<DoctorModel>>> getDoctors({
    required int page,
    required int limit,
    required DoctorsFilter filter,
  }) async{
    try {
      final data = await _service.getDoctors(
        page: page,
        limit: limit,
        filter: filter,
      );
      return Right(data);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}