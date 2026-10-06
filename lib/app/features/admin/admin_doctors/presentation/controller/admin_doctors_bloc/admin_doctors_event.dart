part of 'admin_doctors_bloc.dart';

sealed class AdminDoctorsEvent extends Equatable {
  const AdminDoctorsEvent();

  @override
  List<Object?> get props => [];
}

class ChangeSpecialtyEvent extends AdminDoctorsEvent {
  final DoctorSpecialty? specialty;

  const ChangeSpecialtyEvent({required this.specialty});

  @override
  List<Object?> get props => [specialty];
}

class LoadAdminDoctorsEvent extends AdminDoctorsEvent {
  const LoadAdminDoctorsEvent();
}

class LoadDoctorsEvent extends AdminDoctorsEvent {
  const LoadDoctorsEvent();
}

class LoadMoreDoctorsEvent extends AdminDoctorsEvent {
  const LoadMoreDoctorsEvent();
}

class SearchDoctorsEvent extends AdminDoctorsEvent {
  final String search;

  const SearchDoctorsEvent({
    required this.search,
  });

  @override
  List<Object?> get props => [search];
}

class DoctorCreatedBlocEvent extends AdminDoctorsEvent {
  final DoctorModel doctor;

  const DoctorCreatedBlocEvent({
    required this.doctor,
  });

  @override
  List<Object?> get props => [doctor];
}

class DoctorUpdatedBlocEvent extends AdminDoctorsEvent {
  final DoctorModel doctor;

  const DoctorUpdatedBlocEvent({
    required this.doctor,
  });

  @override
  List<Object?> get props => [doctor];
}

class DoctorDeletedBlocEvent extends AdminDoctorsEvent {
  final String doctorId;

  const DoctorDeletedBlocEvent({
    required this.doctorId,
  });

  @override
  List<Object?> get props => [doctorId];
}

