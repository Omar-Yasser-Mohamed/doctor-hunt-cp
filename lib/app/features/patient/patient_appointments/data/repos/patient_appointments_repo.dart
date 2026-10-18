import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/enums/appointment_status.dart';
import 'package:doctor_hunt/app/core/shared/models/appointment_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';

abstract class PatientAppointmentsRepo {
  Future<Either<Failure, List<AppointmentModel>>> getPatientAppointments({
    required AppointmentStatus status,
    int? page,
    int? limit,
  });
}