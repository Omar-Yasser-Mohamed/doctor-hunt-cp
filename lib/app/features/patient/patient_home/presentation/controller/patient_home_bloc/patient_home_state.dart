part of 'patient_home_bloc.dart';

sealed class PatientHomeState extends Equatable {
  const PatientHomeState();

  @override
  List<Object> get props => [];
}

final class PatientHomeInitial extends PatientHomeState {}

final class PatientHomeLoading extends PatientHomeState {}

final class PatientHomeSuccess extends PatientHomeState {
  final List<DoctorModel> popularDoctors;
  final List<DoctorModel> topRatedDoctors;

  const PatientHomeSuccess({
    this.popularDoctors = const [],
    this.topRatedDoctors = const [],
  });

  @override
  List<Object> get props => [popularDoctors, topRatedDoctors];
}

final class PatientHomeFailure extends PatientHomeState {
  final Failure failure;

  const PatientHomeFailure(this.failure);

  @override
  List<Object> get props => [failure];
}

final class PatientMorePopularLoading extends PatientHomeState {}

final class PatientMoreTopRatedLoading extends PatientHomeState {}

final class PatientHomePaginationFailure extends PatientHomeState {
  final Failure failure;

  const PatientHomePaginationFailure(this.failure);

  @override
  List<Object> get props => [failure];
}
