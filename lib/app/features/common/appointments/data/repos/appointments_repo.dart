import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/appointment_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';

abstract class AppointmentsRepo {
  Future<Either<Failure, AppointmentModel>> getAppointmentDetails(String appointmentId);
  Future<Either<Failure, void>> cancelAppointment(String appointmentId);
  Future<Either<Failure, void>> markAppointmentAsCompleted(String appointmentId);
}