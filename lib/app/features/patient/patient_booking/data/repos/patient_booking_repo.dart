import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/appointment_model.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_availability_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/patient/patient_booking/data/models/book_appointment.dart';

abstract class PatientBookingRepo {
  Future<Either<Failure, DoctorAvailabilityModel>> getDoctorAvailability({
    required String doctorId,
  });

  Future<Either<Failure, List<AppointmentModel>>> getDoctorAppointments({
    required String doctorId,
    required DateTime date,
  });

  Future<Either<Failure, void>> bookAppointment(BookAppointment bookAppointment);
}
