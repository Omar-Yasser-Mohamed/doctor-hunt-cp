import 'package:doctor_hunt/app/core/error/error_handler.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/patient/patient_doctor_details/data/repos/patient_doctor_details_repo.dart';
import 'package:doctor_hunt/app/features/patient/patient_doctor_details/data/services/patient_doctor_details_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PatientDoctorDetailsRepo)
class PatientDoctorDetailsRepoImpl implements PatientDoctorDetailsRepo {
  const PatientDoctorDetailsRepoImpl(this._service);

  final PatientDoctorDetailsService _service;

  @override
  Future<Either<Failure, DoctorModel>> getDoctorDetails({
    required String doctorId,
  }) async {
    try {
      final response = await _service.getDoctorDetails(doctorId: doctorId);
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
