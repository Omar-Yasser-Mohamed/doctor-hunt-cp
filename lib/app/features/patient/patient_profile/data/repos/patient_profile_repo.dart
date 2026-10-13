import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/current_user_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/patient/patient_profile/data/models/update_patient_profile.dart';

abstract class PatientProfileRepo {
  Future<Either<Failure, CurrentUserModel>> updatePatientProfile(
    UpdatePatientProfile request,
  );
}
