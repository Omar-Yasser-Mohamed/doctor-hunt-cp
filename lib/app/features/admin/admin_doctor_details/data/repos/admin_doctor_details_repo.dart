import 'package:doctor_hunt/app/core/error/error_handler.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_details/data/services/admin_doctor_details_service.dart';
import 'package:injectable/injectable.dart';

abstract class AdminDoctorDetailsRepo {
  Future<Either<Failure, DoctorModel>> getDoctorDetails({
    required String doctorId,
  });
}

@LazySingleton(as: AdminDoctorDetailsRepo)
class AdminDoctorDetailsRepoImpl implements AdminDoctorDetailsRepo {
  AdminDoctorDetailsRepoImpl(this._service);
  final AdminDoctorDetailsService _service;

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
