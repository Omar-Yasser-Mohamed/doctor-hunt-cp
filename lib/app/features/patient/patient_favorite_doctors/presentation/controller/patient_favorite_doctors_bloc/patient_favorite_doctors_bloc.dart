import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/features/patient/patient_favorite_doctors/data/repos/patient_favorite_doctors_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'patient_favorite_doctors_event.dart';
part 'patient_favorite_doctors_state.dart';

@injectable
class PatientFavoriteDoctorsBloc
    extends Bloc<PatientFavoriteDoctorsEvent, PatientFavoriteDoctorsState> {
  final PatientFavoriteDoctorsRepo _patientFavoriteDoctorsRepo;
  PatientFavoriteDoctorsBloc(this._patientFavoriteDoctorsRepo)
    : super(PatientFavoriteDoctorsInitial()) {
    on<GetMyFavoriteDoctorsEvent>(_onGetMyFavoriteDoctors);
    on<ToggleDoctorInFavoritesEvent>(_onToggleDoctorInFavorites);
  }

  final Map<String, DoctorModel> _doctors = {};
  List<DoctorModel> get doctors => _doctors.values.toList();

  bool isDoctorInFavorites(String doctorId) => _doctors.containsKey(doctorId);

  Future<void> _onGetMyFavoriteDoctors(
    GetMyFavoriteDoctorsEvent event,
    Emitter<PatientFavoriteDoctorsState> emit,
  ) async {
    emit(GetMyFavoriteDoctorsLoading());

    final result = await _patientFavoriteDoctorsRepo.getMyFavoriteDoctors();

    result.fold(
      (failure) => emit(GetMyFavoriteDoctorsFailure(failure: failure)),
      (doctors) {
        _doctors.clear();

        for (var doctor in doctors) {
          _doctors[doctor.id] = doctor;
        }

        emit(GetMyFavoriteDoctorsSuccess(doctors: doctors));
      },
    );
  }

  Future<void> _onToggleDoctorInFavorites(
    ToggleDoctorInFavoritesEvent event,
    Emitter<PatientFavoriteDoctorsState> emit,
  ) async {
    if (event.isFavorite) {
      _doctors.remove(event.doctor.id);
    } else {
      _doctors[event.doctor.id] = event.doctor;
    }
    emit(GetMyFavoriteDoctorsSuccess(doctors: doctors));

    final result = await _patientFavoriteDoctorsRepo.toggleDoctorInFavorites(
      doctorId: event.doctor.id,
      isFavorite: event.isFavorite,
    );
    result.fold(
      (failure) {
        if (event.isFavorite) {
          _doctors[event.doctor.id] = event.doctor;
        } else {
          _doctors.remove(event.doctor.id);
        }
        emit(ToggleDoctorInFavoritesFailure(failure: failure));
      },
      (doctor) {},
    );
  }
}
