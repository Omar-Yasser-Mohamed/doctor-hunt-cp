part of 'find_doctors_bloc.dart';

sealed class FindDoctorsState extends Equatable {
  const FindDoctorsState();

  @override
  List<Object> get props => [];
}

final class FindDoctorsInitial extends FindDoctorsState {}

final class FindDoctorsLoading extends FindDoctorsState {}

final class FindDoctorsSuccess extends FindDoctorsState {
  final List<DoctorModel> doctors;

  const FindDoctorsSuccess({required this.doctors});

  @override
  List<Object> get props => [doctors];
}

final class FindDoctorsFailure extends FindDoctorsState {
  final Failure failure;

  const FindDoctorsFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}

final class FindDoctorsPaginationLoading extends FindDoctorsState {}

final class FindDoctorsPaginationFailure extends FindDoctorsState {
  final Failure failure;

  const FindDoctorsPaginationFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}
