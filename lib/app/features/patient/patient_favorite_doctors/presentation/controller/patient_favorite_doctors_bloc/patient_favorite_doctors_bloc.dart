import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/controller/admin_doctors_bloc/admin_doctors_bloc.dart';
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
    on<SearchInMyFavoriteDoctorsEvent>(
      _onSearchMyFavoriteDoctors,
      transformer: searchTransformer(),
    );
    on<ClearSearchEvent>(_onClearSearch);
  }

  final Map<String, DoctorModel> _doctors = {};
  List<DoctorModel> get doctors => _doctors.values.toList();

  final Map<String, DoctorModel> _searchedDoctors = {};
  List<DoctorModel> get searchedDoctors => _searchedDoctors.values.toList();

  String? _query;
  String? get query => _query;

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
      _searchedDoctors.remove(event.doctor.id);
    } else {
      _doctors[event.doctor.id] = event.doctor;
      _searchedDoctors[event.doctor.id] = event.doctor;
    }
    if (searchedDoctors.isEmpty && _query != null && _query!.isNotEmpty) {
      emit(EmptySearchedFavoriteDoctors());
    } else if (doctors.isEmpty) {
      emit(EmptyFavoriteDoctors());
    } else if (_query == null || _query!.isEmpty) {
      emit(GetMyFavoriteDoctorsSuccess(doctors: doctors));
    } else {
      emit(GetMyFavoriteDoctorsSuccess(doctors: searchedDoctors));
    }

    final result = await _patientFavoriteDoctorsRepo.toggleDoctorInFavorites(
      doctorId: event.doctor.id,
      isFavorite: event.isFavorite,
    );
    result.fold(
      (failure) {
        if (event.isFavorite) {
          _doctors[event.doctor.id] = event.doctor;
          _searchedDoctors[event.doctor.id] = event.doctor;
        } else {
          _doctors.remove(event.doctor.id);
          _searchedDoctors.remove(event.doctor.id);
        }

        if (searchedDoctors.isEmpty && _query != null && _query!.isNotEmpty) {
          emit(EmptySearchedFavoriteDoctors());
        } else if (doctors.isEmpty) {
          emit(EmptyFavoriteDoctors());
        } else if (_query == null || _query!.isEmpty) {
          emit(GetMyFavoriteDoctorsSuccess(doctors: doctors));
        } else {
          emit(GetMyFavoriteDoctorsSuccess(doctors: searchedDoctors));
        }
      },
      (doctor) {},
    );
  }

  Future<void> _onSearchMyFavoriteDoctors(
    SearchInMyFavoriteDoctorsEvent event,
    Emitter<PatientFavoriteDoctorsState> emit,
  ) async {
    _query = event.query;

    if (event.query.isEmpty) {
      _searchedDoctors.clear();

      if (doctors.isEmpty) {
        emit(EmptyFavoriteDoctors());
        return;
      }

      emit(GetMyFavoriteDoctorsSuccess(doctors: doctors));
      return;
    }

    emit(GetMyFavoriteDoctorsLoading());

    final result = await _patientFavoriteDoctorsRepo.searchMyFavoriteDoctors(
      event.query,
    );

    result.fold(
      (failure) => emit(GetMyFavoriteDoctorsFailure(failure: failure)),
      (searchedDoctors) {
        _searchedDoctors.clear();
        if (searchedDoctors.isEmpty) {
          emit(EmptySearchedFavoriteDoctors());
          return;
        }
        for (var doctor in searchedDoctors) {
          _searchedDoctors[doctor.id] = doctor;
        }

        emit(GetMyFavoriteDoctorsSuccess(doctors: searchedDoctors));
      },
    );
  }

  void _onClearSearch(
    ClearSearchEvent event,
    Emitter<PatientFavoriteDoctorsState> emit,
  ) {
    _query = null;
    _searchedDoctors.clear();

    if (doctors.isEmpty) {
      emit(EmptyFavoriteDoctors());
      return;
    }

    emit(GetMyFavoriteDoctorsSuccess(doctors: doctors));
  }
}
