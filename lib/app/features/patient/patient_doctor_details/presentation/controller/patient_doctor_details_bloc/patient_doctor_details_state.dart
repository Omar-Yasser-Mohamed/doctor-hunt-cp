part of 'patient_doctor_details_bloc.dart';

sealed class PatientDoctorDetailsState extends Equatable {
  const PatientDoctorDetailsState();

  @override
  List<Object?> get props => [];
}

final class PatientDoctorDetailsInitial extends PatientDoctorDetailsState {}

final class PatientDoctorDetailsLoading extends PatientDoctorDetailsState {}

final class PatientDoctorDetailsSuccess extends PatientDoctorDetailsState {
  const PatientDoctorDetailsSuccess({required this.doctor});

  final DoctorModel doctor;

  @override
  List<Object?> get props => [doctor];
}

final class PatientDoctorDetailsFailure extends PatientDoctorDetailsState {
  const PatientDoctorDetailsFailure({required this.failure});

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}
