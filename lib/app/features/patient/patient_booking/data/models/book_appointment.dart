import 'package:doctor_hunt/app/features/patient/patient_booking/data/models/appointment_slot.dart';
import 'package:equatable/equatable.dart';

class BookAppointment extends Equatable {
  final String doctorId;
  final AppointmentSlot appointmentAt;

  const BookAppointment({required this.doctorId, required this.appointmentAt});

  Map<String, dynamic> toRpcParams() {
    return {
      'p_doctor_id': doctorId,
      'p_appointment_at': appointmentAt.date.toUtc().toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [doctorId, appointmentAt];
}
