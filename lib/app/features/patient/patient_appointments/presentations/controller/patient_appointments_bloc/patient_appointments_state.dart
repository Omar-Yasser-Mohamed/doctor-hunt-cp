part of 'patient_appointments_bloc.dart';

sealed class PatientAppointmentsState extends Equatable {
  const PatientAppointmentsState();

  @override
  List<Object> get props => [];
}

final class PatientAppointmentsInitial extends PatientAppointmentsState {}

final class GetPatientAppointmentsLoading extends PatientAppointmentsState {}

final class GetPatientAppointmentsSuccess extends PatientAppointmentsState {
  final List<AppointmentModel> appointments;
  const GetPatientAppointmentsSuccess({required this.appointments});
  @override
  List<Object> get props => [appointments];
}

final class GetPatientAppointmentsFailure extends PatientAppointmentsState {
  final Failure failure;
  const GetPatientAppointmentsFailure({required this.failure});
  @override
  List<Object> get props => [failure];
}

final class GetPatientAppointmentsPaginationLoading
    extends PatientAppointmentsState {}

final class PatientAppointmentsActionFailure extends PatientAppointmentsState {
  final Failure failure;
  const PatientAppointmentsActionFailure({required this.failure});
  @override
  List<Object> get props => [failure];
}

final class PatientAppointmentsActionLoading extends PatientAppointmentsState {}

final class PatientAppointmentsCanceledSuccess
    extends PatientAppointmentsState {}
