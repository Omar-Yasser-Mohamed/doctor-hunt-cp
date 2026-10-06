import 'package:doctor_hunt/app/core/error/error_handler.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/data/models/create_doctor_request.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/data/repos/doctor_management_repo.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/data/services/doctor_management_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DoctorManagementRepo)
final class DoctorManagementRepoImpl implements DoctorManagementRepo {
  DoctorManagementRepoImpl(this._doctorManagementService);
  final DoctorManagementService _doctorManagementService;

  @override
  Future<Either<Failure, DoctorModel>> createDoctor(
    CreateDoctorRequest request,
  ) async {
    try {
      final doctor = await _doctorManagementService.createDoctor(request);
      return Right(doctor);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}