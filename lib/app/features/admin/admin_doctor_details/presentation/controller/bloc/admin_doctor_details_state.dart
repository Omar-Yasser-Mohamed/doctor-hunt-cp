part of 'admin_doctor_details_bloc.dart';

sealed class AdminDoctorDetailsState extends Equatable {
  const AdminDoctorDetailsState();

  @override
  List<Object> get props => [];
}

final class AdminDoctorDetailsInitial extends AdminDoctorDetailsState {}

final class AdminDoctorDetailsLoading extends AdminDoctorDetailsState {}

final class AdminDoctorDetailsSuccess extends AdminDoctorDetailsState {
  final DoctorModel doctor;

  const AdminDoctorDetailsSuccess({required this.doctor});

  @override
  List<Object> get props => [doctor];
}

final class AdminDoctorDetailsFailure extends AdminDoctorDetailsState {
  final Failure failure;

  const AdminDoctorDetailsFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}
