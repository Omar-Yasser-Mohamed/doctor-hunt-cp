import 'package:doctor_hunt/app/core/error/error_handler.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/enums/doctor_specialty.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/data/models/doctors_stats.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/data/repos/admin_doctors_repo.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/data/services/admin_doctors_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AdminDoctorsRepo)
class AdminDoctorsRepoImpl implements AdminDoctorsRepo {
  const AdminDoctorsRepoImpl(this._adminDoctorsService);
  final AdminDoctorsService _adminDoctorsService;

  @override
  Future<Either<Failure, DoctorsStats>> getDoctorStats() async {
    try {
      final result = await _adminDoctorsService.getDoctorStats();
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, Map<String, int>>> getSpecialtyCounts() async {
    try {
      final result = await _adminDoctorsService.getSpecialtyCounts();
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<DoctorModel>>> getDoctors({
    String? search,
    DoctorSpecialty? specialty,
    required int page,
    int limit = 10,
  }) async {
    try {
      final result = await _adminDoctorsService.getDoctors(
        search: search,
        specialty: specialty,
        page: page,
        limit: limit,
      );
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}