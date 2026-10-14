import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';

abstract class PatientFavoriteDoctorsRepo {
  Future<Either<Failure, List<DoctorModel>>> getMyFavoriteDoctors();
  Future<Either<Failure, void>> toggleDoctorInFavorites({
    required String doctorId,
    required bool isFavorite,
  });
}
