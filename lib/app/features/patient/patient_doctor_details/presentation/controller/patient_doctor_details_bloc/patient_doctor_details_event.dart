part of 'patient_doctor_details_bloc.dart';

sealed class PatientDoctorDetailsEvent extends Equatable {
  const PatientDoctorDetailsEvent();

  @override
  List<Object?> get props => [];
}

class GetPatientDoctorDetailsEvent extends PatientDoctorDetailsEvent {
  const GetPatientDoctorDetailsEvent({required this.doctorId});

  final String doctorId;

  @override
  List<Object?> get props => [doctorId];
}
