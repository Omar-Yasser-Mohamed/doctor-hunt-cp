part of 'admin_appointments_bloc.dart';

sealed class AdminAppointmentsEvent extends Equatable {
  const AdminAppointmentsEvent();

  @override
  List<Object> get props => [];
}

class ChangeAppointmentStatusEvent extends AdminAppointmentsEvent {
  final AppointmentStatus status;
  const ChangeAppointmentStatusEvent({required this.status});
  @override
  List<Object> get props => [status];
}

class GetAdminAppointmentsEvent extends AdminAppointmentsEvent {
  const GetAdminAppointmentsEvent();

  @override
  List<Object> get props => [];
}

class GetMoreAdminAppointmentsEvent extends AdminAppointmentsEvent {
  const GetMoreAdminAppointmentsEvent();

  @override
  List<Object> get props => [];
}

class CancelAppointmentFromDetailsEvent extends AdminAppointmentsEvent {
  final String appointmentId;
  const CancelAppointmentFromDetailsEvent({required this.appointmentId});
  @override
  List<Object> get props => [appointmentId];
}

class AdminCancelAppointmentEvent extends AdminAppointmentsEvent {
  final String appointmentId;
  const AdminCancelAppointmentEvent({required this.appointmentId});
  @override
  List<Object> get props => [appointmentId];
}
