part of 'patient_update_profile_bloc.dart';

sealed class PatientUpdateProfileState extends Equatable {
  const PatientUpdateProfileState();

  @override
  List<Object> get props => [];
}

final class PatientUpdateProfileInitial extends PatientUpdateProfileState {}

final class PatientUpdateProfileLoading extends PatientUpdateProfileState {}

final class PatientUpdateProfileSuccess extends PatientUpdateProfileState {
  final CurrentUserModel currentUserModel;

  const PatientUpdateProfileSuccess(this.currentUserModel);
  @override
  List<Object> get props => [currentUserModel];
}

final class PatientUpdateProfileFailure extends PatientUpdateProfileState {
  final Failure failure;

  const PatientUpdateProfileFailure(this.failure);

  @override
  List<Object> get props => [failure];
}

final class PatientUpdateProfileChangeImage extends PatientUpdateProfileState {
  final File image;
  const PatientUpdateProfileChangeImage(this.image);
  @override
  List<Object> get props => [image];
}

final class PatientUpdateProfileFormDirtyChanged extends PatientUpdateProfileState {
  final bool isDirty;

  const PatientUpdateProfileFormDirtyChanged({required this.isDirty});

  @override
  List<Object> get props => [isDirty];
}
