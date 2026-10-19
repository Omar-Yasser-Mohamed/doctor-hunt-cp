part of 'appointment_details_bloc.dart';

sealed class AppointmentDetailsEvent extends Equatable {
  const AppointmentDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetAppointmentDetailsEvent extends AppointmentDetailsEvent {
  const GetAppointmentDetailsEvent({required this.appointmentId});
  final String appointmentId;

  @override
  List<Object> get props => [appointmentId];
}

class CancelAppointmentFromDetailsEvent extends AppointmentDetailsEvent {
  const CancelAppointmentFromDetailsEvent({required this.appointmentId});
  final String appointmentId;

  @override
  List<Object> get props => [appointmentId];
}
