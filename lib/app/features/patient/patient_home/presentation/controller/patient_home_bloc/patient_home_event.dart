part of 'patient_home_bloc.dart';

sealed class PatientHomeEvent extends Equatable {
  const PatientHomeEvent();

  @override
  List<Object> get props => [];
}

class GetHomeDoctors extends PatientHomeEvent {
  const GetHomeDoctors();

  @override
  List<Object> get props => [];
}

class LoadMorePopularDoctors extends PatientHomeEvent {
  const LoadMorePopularDoctors();

  @override
  List<Object> get props => [];
}

class LoadMoreTopRatedDoctors extends PatientHomeEvent {
  const LoadMoreTopRatedDoctors();

  @override
  List<Object> get props => [];
}
