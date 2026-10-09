part of 'patient_doctors_list_bloc.dart';

sealed class PatientDoctorsListState extends Equatable {
  const PatientDoctorsListState();

  @override
  List<Object> get props => [];
}

final class PatientDoctorsListInitial extends PatientDoctorsListState {}

final class PatientDoctorsListLoading extends PatientDoctorsListState {}

final class PatientDoctorsListSuccess extends PatientDoctorsListState {
  final List<DoctorModel> doctors;

  const PatientDoctorsListSuccess({required this.doctors});

  @override
  List<Object> get props => [doctors];
}

final class PatientDoctorsListFailure extends PatientDoctorsListState {
  final Failure failure;

  const PatientDoctorsListFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}

final class PatientDoctorsListPaginationLoading
    extends PatientDoctorsListState {}

final class PatientDoctorsListPaginationFailure
    extends PatientDoctorsListState {
  final Failure failure;

  const PatientDoctorsListPaginationFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}
