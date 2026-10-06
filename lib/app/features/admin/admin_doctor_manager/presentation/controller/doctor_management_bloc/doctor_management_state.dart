part of 'doctor_management_bloc.dart';

sealed class DoctorManagementState extends Equatable {
  const DoctorManagementState();

  @override
  List<Object> get props => [];
}

final class DoctorManagementInitial extends DoctorManagementState {}

final class DoctorManagementLoading extends DoctorManagementState {}

final class DoctorManagementSuccess extends DoctorManagementState {
  final DoctorModel doctor;

  const DoctorManagementSuccess({required this.doctor});

  @override
  List<Object> get props => [doctor];
}

final class DoctorManagementFailure extends DoctorManagementState {
  final Failure failure;

  const DoctorManagementFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}

final class DoctorManagementImageNotPicked extends DoctorManagementState {
  const DoctorManagementImageNotPicked();

  @override
  List<Object> get props => [];
}

class DoctorManagementImagePicked extends DoctorManagementState {
  final File imageFile;

  const DoctorManagementImagePicked({required this.imageFile});

  @override
  List<Object> get props => [imageFile];
}

class DoctorManagementImageRemoved extends DoctorManagementState {
  const DoctorManagementImageRemoved();

  @override
  List<Object> get props => [];
}

final class DoctorManagementUpdateLoading extends DoctorManagementState {}

final class DoctorManagementUpdateSuccess extends DoctorManagementState {
  final DoctorModel doctor;

  const DoctorManagementUpdateSuccess({required this.doctor});

  @override
  List<Object> get props => [doctor];
}

final class DoctorManagementDeleteLoading extends DoctorManagementState {}

final class DoctorManagementDeleteSuccess extends DoctorManagementState {
  const DoctorManagementDeleteSuccess();

  @override
  List<Object> get props => [];
}

