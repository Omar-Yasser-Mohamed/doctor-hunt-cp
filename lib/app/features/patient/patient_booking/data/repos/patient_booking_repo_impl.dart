import 'package:doctor_hunt/app/core/error/error_handler.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/appointment_model.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_availability_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/patient/patient_booking/data/models/book_appointment.dart';
import 'package:doctor_hunt/app/features/patient/patient_booking/data/repos/patient_booking_repo.dart';
import 'package:doctor_hunt/app/features/patient/patient_booking/data/service/patient_booking_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PatientBookingRepo)
class PatientBookingRepoImpl implements PatientBookingRepo {
  PatientBookingRepoImpl(this._service);
  final PatientBookingService _service;

  @override
  Future<Either<Failure, DoctorAvailabilityModel>> getDoctorAvailability({
    required String doctorId,
  }) async {
    try {
      final response = await _service.getDoctorAvailability(doctorId: doctorId);
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<AppointmentModel>>> getDoctorAppointments({
    required String doctorId,
    required DateTime date,
  }) async {
    try {
      final response = await _service.getDoctorAppointments(
        doctorId: doctorId,
        date: date,
      );
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> bookAppointment(
    BookAppointment bookAppointment,
  ) async {
    try {
      await _service.bookAppointment(bookAppointment);
      return const Right(null);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
