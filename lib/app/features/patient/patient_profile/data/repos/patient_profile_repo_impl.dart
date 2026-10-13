import 'package:doctor_hunt/app/core/error/error_handler.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/current_user_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/patient/patient_profile/data/models/update_patient_profile.dart';
import 'package:doctor_hunt/app/features/patient/patient_profile/data/repos/patient_profile_repo.dart';
import 'package:doctor_hunt/app/features/patient/patient_profile/data/service/patient_profile_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PatientProfileRepo)
class PatientProfileRepoImpl implements PatientProfileRepo {
  PatientProfileRepoImpl(this._service);
  final PatientProfileService _service;
  @override
  Future<Either<Failure, CurrentUserModel>> updatePatientProfile(
    UpdatePatientProfile request,
  ) async {
    try {
      final result = await _service.updatePatientProfile(request);
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
