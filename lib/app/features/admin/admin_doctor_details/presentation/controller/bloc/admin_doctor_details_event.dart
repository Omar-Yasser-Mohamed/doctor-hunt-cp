part of 'admin_doctor_details_bloc.dart';

sealed class AdminDoctorDetailsEvent extends Equatable {
  const AdminDoctorDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetDoctorDetailsEvent extends AdminDoctorDetailsEvent {
  const GetDoctorDetailsEvent({required this.doctorId});
  final String doctorId;

  @override
  List<Object> get props => [doctorId];
}

class DoctorUpdatedDetailsEvent extends AdminDoctorDetailsEvent {
  const DoctorUpdatedDetailsEvent({required this.doctor});
  final DoctorModel doctor;

  @override
  List<Object> get props => [doctor];
}
