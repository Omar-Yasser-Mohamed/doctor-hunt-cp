import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/enums/doctor_specialty.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/data/models/doctors_stats.dart';

abstract class AdminDoctorsRepo {
  Future<Either<Failure, DoctorsStats>> getDoctorStats();

  Future<Either<Failure, Map<String, int>>> getSpecialtyCounts();

  Future<Either<Failure, List<DoctorModel>>> getDoctors({
    String? search,
    DoctorSpecialty? specialty,
    required int page,
    int limit = 10,
  });
}
