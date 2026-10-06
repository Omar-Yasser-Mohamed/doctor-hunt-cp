import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/data/models/create_doctor_request.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/data/models/update_doctor_request.dart';

abstract class DoctorManagementRepo {
  Future<Either<Failure, DoctorModel>> createDoctor(
    CreateDoctorRequest request,
  );
  Future<Either<Failure, DoctorModel>> updateDoctor(
    UpdateDoctorRequest request,
  );
  Future<Either<Failure, void>> deleteDoctor(
    String doctorId,
  );
}
