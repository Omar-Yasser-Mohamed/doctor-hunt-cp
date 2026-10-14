part of 'patient_favorite_doctors_bloc.dart';

sealed class PatientFavoriteDoctorsState extends Equatable {
  const PatientFavoriteDoctorsState();

  @override
  List<Object> get props => [];
}

final class PatientFavoriteDoctorsInitial extends PatientFavoriteDoctorsState {}

final class ToggleDoctorInFavoritesFailure extends PatientFavoriteDoctorsState {
  final Failure failure;
  const ToggleDoctorInFavoritesFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}

final class GetMyFavoriteDoctorsLoading extends PatientFavoriteDoctorsState {}

final class GetMyFavoriteDoctorsSuccess extends PatientFavoriteDoctorsState {
  final List<DoctorModel> doctors;
  const GetMyFavoriteDoctorsSuccess({required this.doctors});

  @override
  List<Object> get props => [doctors];
}

final class GetMyFavoriteDoctorsFailure extends PatientFavoriteDoctorsState {
  final Failure failure;
  const GetMyFavoriteDoctorsFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}
