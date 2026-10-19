part of 'patient_appointments_bloc.dart';

sealed class PatientAppointmentsEvent extends Equatable {
  const PatientAppointmentsEvent();

  @override
  List<Object> get props => [];
}

class ChangeAppointmentStatusTabEvent extends PatientAppointmentsEvent {
  final AppointmentStatus status;
  const ChangeAppointmentStatusTabEvent({required this.status});
  @override
  List<Object> get props => [status];
}

class GetPatientAppointmentsEvent extends PatientAppointmentsEvent {
  const GetPatientAppointmentsEvent();
  @override
  List<Object> get props => [];
}

class GetMorePatientAppointmentsEvent extends PatientAppointmentsEvent {
  const GetMorePatientAppointmentsEvent();
  @override
  List<Object> get props => [];
}

class CancelAppointmentFromDetailsEvent extends PatientAppointmentsEvent { //form details screen
  final String appointmentId;
  const CancelAppointmentFromDetailsEvent({required this.appointmentId});
  @override
  List<Object> get props => [appointmentId];
}

class PatientCancelAppointmentEvent extends PatientAppointmentsEvent {
  final String appointmentId;
  const PatientCancelAppointmentEvent({required this.appointmentId});
  @override
  List<Object> get props => [appointmentId];
}
