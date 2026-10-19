part of 'admin_appointments_bloc.dart';

sealed class AdminAppointmentsState extends Equatable {
  const AdminAppointmentsState();

  @override
  List<Object> get props => [];
}

final class AdminAppointmentsInitial extends AdminAppointmentsState {}

final class GetAdminAppointmentsLoading extends AdminAppointmentsState {}

final class GetAdminAppointmentsSuccess extends AdminAppointmentsState {
  final List<AppointmentModel> appointments;
  const GetAdminAppointmentsSuccess({required this.appointments});
  @override
  List<Object> get props => [appointments];
}

final class GetAdminAppointmentsFailure extends AdminAppointmentsState {
  final Failure failure;
  const GetAdminAppointmentsFailure({required this.failure});
  @override
  List<Object> get props => [failure];
}

final class GetAdminAppointmentsPaginationFailure extends AdminAppointmentsState {
  final Failure failure;
  const GetAdminAppointmentsPaginationFailure({required this.failure});
  @override
  List<Object> get props => [failure];
}

final class GetAdminAppointmentsPaginationLoading
    extends AdminAppointmentsState {}

final class AdminAppointmentsActionFailure extends AdminAppointmentsState {
  final Failure failure;
  const AdminAppointmentsActionFailure({required this.failure});
  @override
  List<Object> get props => [failure];
}

final class AdminAppointmentsActionLoading extends AdminAppointmentsState {}

final class AdminAppointmentsCanceledSuccess extends AdminAppointmentsState {}

final class AdminAppointmentsCompletedSuccess extends AdminAppointmentsState {}
