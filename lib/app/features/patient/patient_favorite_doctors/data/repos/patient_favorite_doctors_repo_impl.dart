import 'package:doctor_hunt/app/core/error/error_handler.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/patient/patient_favorite_doctors/data/repos/patient_favorite_doctors_repo.dart';
import 'package:doctor_hunt/app/features/patient/patient_favorite_doctors/data/service/patient_favorite_doctors_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PatientFavoriteDoctorsRepo)
class PatientFavoriteDoctorsRepoImpl implements PatientFavoriteDoctorsRepo {
  const PatientFavoriteDoctorsRepoImpl(this._service);
  final PatientFavoriteDoctorsService _service;

  @override
  Future<Either<Failure, List<DoctorModel>>> getMyFavoriteDoctors() async {
    try {
      final result = await _service.getMyFavoriteDoctors();
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> toggleDoctorInFavorites({
    required String doctorId,
    required bool isFavorite,
  }) async {
    try {
      final result = await _service.toggleDoctorInFavorites(
        doctorId: doctorId,
        isFavorite: isFavorite,
      );
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
