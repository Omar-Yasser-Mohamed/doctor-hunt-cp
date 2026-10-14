part of 'patient_favorite_doctors_bloc.dart';

sealed class PatientFavoriteDoctorsEvent extends Equatable {
  const PatientFavoriteDoctorsEvent();

  @override
  List<Object> get props => [];
}

final class ToggleDoctorInFavoritesEvent extends PatientFavoriteDoctorsEvent {
  final DoctorModel doctor;
  final bool isFavorite;
  const ToggleDoctorInFavoritesEvent({
    required this.doctor,
    required this.isFavorite,
  });

  @override
  List<Object> get props => [doctor, isFavorite];
}

final class GetMyFavoriteDoctorsEvent extends PatientFavoriteDoctorsEvent {
  const GetMyFavoriteDoctorsEvent();

  @override
  List<Object> get props => [];
}

final class SearchInMyFavoriteDoctorsEvent extends PatientFavoriteDoctorsEvent {
  final String query;
  const SearchInMyFavoriteDoctorsEvent({required this.query});

  @override
  List<Object> get props => [query];
}
