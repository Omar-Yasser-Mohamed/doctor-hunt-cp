part of 'patient_update_profile_bloc.dart';

sealed class PatientUpdateProfileEvent extends Equatable {
  const PatientUpdateProfileEvent();

  @override
  List<Object?> get props => [];
}

final class UpdatePatientProfileEvent extends PatientUpdateProfileEvent {
  final String? name;
  const UpdatePatientProfileEvent({this.name});
  @override
  List<Object?> get props => [name];
}

final class UpdatePatientProfileChangeImage extends PatientUpdateProfileEvent {
  final ImageSource source;
  const UpdatePatientProfileChangeImage({required this.source});
  @override
  List<Object?> get props => [source];
}

final class UpdatePatientProfileInitialized extends PatientUpdateProfileEvent {
  final CurrentUserModel currentUser;

  const UpdatePatientProfileInitialized(this.currentUser);

  @override
  List<Object?> get props => [currentUser];
}

final class UpdatePatientProfileNameChanged extends PatientUpdateProfileEvent {
  final String name;

  const UpdatePatientProfileNameChanged(this.name);

  @override
  List<Object?> get props => [name];
}
