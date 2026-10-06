part of 'admin_doctors_bloc.dart';

sealed class AdminDoctorsState extends Equatable {
  const AdminDoctorsState();

  @override
  List<Object?> get props => [];
}

final class AdminDoctorsInitial extends AdminDoctorsState {}

final class AdminDoctorsLoading extends AdminDoctorsState {}

final class AdminDoctorsListLoading extends AdminDoctorsState {}

final class AdminDoctorsPaginationLoading extends AdminDoctorsState {}

final class AdminDoctorsSuccess extends AdminDoctorsState {
  final DoctorsStats stats;
  final Map<String, int> specialtyCounts;
  final List<DoctorModel> doctors;

  const AdminDoctorsSuccess({
    required this.stats,
    required this.specialtyCounts,
    required this.doctors,
  });

  @override
  List<Object?> get props => [
    stats,
    specialtyCounts,
    doctors,
  ];
}

final class AdminDoctorsFailure extends AdminDoctorsState {
  final Failure failure;

  const AdminDoctorsFailure({required this.failure});

  @override
  List<Object?> get props => [failure];
}

final class AdminDoctorsPaginationFailure extends AdminDoctorsState {
  final Failure failure;

  const AdminDoctorsPaginationFailure({required this.failure});

  @override
  List<Object?> get props => [failure];
}
