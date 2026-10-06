part of 'doctor_management_bloc.dart';

sealed class DoctorManagementEvent extends Equatable {
  const DoctorManagementEvent();

  @override
  List<Object> get props => [];
}

class PickDoctorProfileImage extends DoctorManagementEvent {
  final ImageSource source;

  const PickDoctorProfileImage({this.source = ImageSource.gallery});

  @override
  List<Object> get props => [source];
}

class RemoveDoctorProfileImage extends DoctorManagementEvent {}

class SelectDoctorSpecialty extends DoctorManagementEvent {
  final DoctorSpecialty specialty;

  const SelectDoctorSpecialty({required this.specialty});

  @override
  List<Object> get props => [specialty];
}

class CreateDoctor extends DoctorManagementEvent {
  final String name;
  final double fees;

  const CreateDoctor({
    required this.name,
    required this.fees,
  });

  @override
  List<Object> get props => [name, fees];
}

class UpdateDoctor extends DoctorManagementEvent {
  final UpdateDoctorRequest request;

  const UpdateDoctor({required this.request});

  @override
  List<Object> get props => [request];
}

class DeleteDoctor extends DoctorManagementEvent {
  final String doctorId;

  const DeleteDoctor({required this.doctorId});

  @override
  List<Object> get props => [doctorId];
}

