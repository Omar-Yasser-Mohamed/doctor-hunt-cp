part of 'patient_doctors_list_bloc.dart';

sealed class PatientDoctorsListEvent extends Equatable {
  const PatientDoctorsListEvent();

  @override
  List<Object> get props => [];
}

class GetDoctorsList extends PatientDoctorsListEvent {
  final DoctorsFilter doctorsFilter;

  const GetDoctorsList({required this.doctorsFilter});

  @override
  List<Object> get props => [doctorsFilter];
}

class GetMoreDoctors extends PatientDoctorsListEvent {
  const GetMoreDoctors();

  @override
  List<Object> get props => [];
}
