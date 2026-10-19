import 'package:doctor_hunt/app/core/error/error_handler.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/enums/appointment_status.dart';
import 'package:doctor_hunt/app/core/shared/models/appointment_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/admin/admin_appointments/data/repos/admin_appointments_repo.dart';
import 'package:doctor_hunt/app/features/admin/admin_appointments/data/service/admin_appointments_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AdminAppointmentsRepo)
class AdminAppointmentsRepoImpl implements AdminAppointmentsRepo {
  final AdminAppointmentsService _service;

  AdminAppointmentsRepoImpl(this._service);

  @override
  Future<Either<Failure, List<AppointmentModel>>> getAdminAppointments({
    required AppointmentStatus status,
    int? page,
    int? limit,
  }) async {
    try {
      final appointments = await _service.getAdminAppointments(
        status: status,
        page: page,
        limit: limit,
      );
      return Right(appointments);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
