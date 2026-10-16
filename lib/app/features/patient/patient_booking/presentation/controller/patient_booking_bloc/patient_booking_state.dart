part of 'patient_booking_bloc.dart';

sealed class PatientBookingState extends Equatable {
  const PatientBookingState();

  @override
  List<Object> get props => [];
}

final class PatientBookingInitial extends PatientBookingState {}

final class GetBookingDataLoading extends PatientBookingState {}

final class GetBookingDataSuccess extends PatientBookingState {
  final List<AppointmentSlot> appointmentSlots;

  const GetBookingDataSuccess({required this.appointmentSlots});

  @override
  List<Object> get props => [appointmentSlots];
}

final class GetBookingDataFailure extends PatientBookingState {
  final Failure failure;

  const GetBookingDataFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}

final class GetAppointmentSlotsLoading extends PatientBookingState {}

final class GetAppointmentSlotsFailure extends PatientBookingState {
  final Failure failure;

  const GetAppointmentSlotsFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}

final class ChangeSelectedAppointmentSlot extends PatientBookingState {
  final AppointmentSlot slot;

  const ChangeSelectedAppointmentSlot({required this.slot});

  @override
  List<Object> get props => [slot];
}

final class BookAppointmentLoading extends PatientBookingState {}

final class BookAppointmentFailure extends PatientBookingState {
  final Failure failure;

  const BookAppointmentFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}

final class BookAppointmentSuccess extends PatientBookingState {
  final AppointmentSlot slot;

  const BookAppointmentSuccess({required this.slot});

  @override
  List<Object> get props => [slot];
}
