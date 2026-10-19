part of 'appointment_details_bloc.dart';

sealed class AppointmentDetailsState extends Equatable {
  const AppointmentDetailsState();

  @override
  List<Object> get props => [];
}

final class AppointmentDetailsInitial extends AppointmentDetailsState {}

final class AppointmentDetailsLoading extends AppointmentDetailsState {}

final class AppointmentDetailsSuccess extends AppointmentDetailsState {
  final AppointmentModel appointment;
  const AppointmentDetailsSuccess({required this.appointment});
  @override
  List<Object> get props => [appointment];
}

final class AppointmentDetailsFailure extends AppointmentDetailsState {
  final Failure failure;
  const AppointmentDetailsFailure({required this.failure});
  @override
  List<Object> get props => [failure];
}

final class AppointmentDetailsActionLoading extends AppointmentDetailsState {}

final class AppointmentCanceledSuccess extends AppointmentDetailsState {}

final class AppointmentCompletedSuccess extends AppointmentDetailsState {}

final class AppointmentDetailsActionFailure extends AppointmentDetailsState {
  final Failure failure;
  const AppointmentDetailsActionFailure({required this.failure});
  @override
  List<Object> get props => [failure];
}
