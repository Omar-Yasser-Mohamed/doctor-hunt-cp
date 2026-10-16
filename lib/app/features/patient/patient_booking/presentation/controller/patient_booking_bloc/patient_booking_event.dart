part of 'patient_booking_bloc.dart';

sealed class PatientBookingEvent extends Equatable {
  const PatientBookingEvent();

  @override
  List<Object> get props => [];
}

class GetDoctorAvailabilityAndAppointments extends PatientBookingEvent {
  final String doctorId;

  const GetDoctorAvailabilityAndAppointments({
    required this.doctorId,
  });

  @override
  List<Object> get props => [doctorId];
}

class GetDoctorAppointmentsRequested extends PatientBookingEvent {
  final DateTime date;

  const GetDoctorAppointmentsRequested({required this.date});

  @override
  List<Object> get props => [date];
}

class SelectAppointmentSlot extends PatientBookingEvent {
  final AppointmentSlot slot;

  const SelectAppointmentSlot({required this.slot});

  @override
  List<Object> get props => [slot];
}

class BookAppointmentEvent extends PatientBookingEvent {
  const BookAppointmentEvent();
}
