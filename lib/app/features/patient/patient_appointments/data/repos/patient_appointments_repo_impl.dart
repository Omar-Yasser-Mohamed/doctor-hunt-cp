import 'package:doctor_hunt/app/core/error/error_handler.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/enums/appointment_status.dart';
import 'package:doctor_hunt/app/core/shared/models/appointment_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/patient/patient_appointments/data/models/create_appointment_review.dart';
import 'package:doctor_hunt/app/features/patient/patient_appointments/data/repos/patient_appointments_repo.dart';
import 'package:doctor_hunt/app/features/patient/patient_appointments/data/service/patient_appointments_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PatientAppointmentsRepo)
class PatientAppointmentsRepoImpl implements PatientAppointmentsRepo {
  PatientAppointmentsRepoImpl(this._service);
  final PatientAppointmentsService _service;

  @override
  Future<Either<Failure, List<AppointmentModel>>> getPatientAppointments({
    required AppointmentStatus status,
    int? page,
    int? limit,
  }) async {
    try {
      final appointments = await _service.getPatientAppointments(
        status: status,
        page: page,
        limit: limit,
      );
      return Right(appointments);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, AppointmentModel>> createAppointmentReview(
    CreateAppointmentReviewRequest request,
  ) async {
    try {
      final appointment = await _service.createAppointmentReview(request);
      return Right(appointment);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}