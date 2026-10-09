import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/data/repos/patient_home_repo.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/params/doctors_filter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'patient_doctors_list_event.dart';
part 'patient_doctors_list_state.dart';

@injectable
class PatientDoctorsListBloc extends Bloc<PatientDoctorsListEvent, PatientDoctorsListState> {
  final PatientHomeRepo _patientHomeRepo;

  PatientDoctorsListBloc(this._patientHomeRepo) : super(PatientDoctorsListInitial()) {
    on<GetDoctorsList>(_onGetDoctorsList);
    on<GetMoreDoctors>(_onGetMoreDoctors);
  }

  final _limit = 10;
  int _page = 1;
  bool _hasMore = true;

  DoctorsFilter? _currentFilter;

  final List<DoctorModel> _doctors = [];
  List<DoctorModel> get doctors => List.unmodifiable(_doctors);

  Future<void> _onGetDoctorsList(
    GetDoctorsList event,
    Emitter<PatientDoctorsListState> emit,
  ) async {
    _currentFilter = event.doctorsFilter;
    _page = 1;
    _hasMore = true;
    _doctors.clear();

    emit(PatientDoctorsListLoading());
    final result =
        await _patientHomeRepo.getDoctors(
        filter: event.doctorsFilter,
        page: _page,
        limit: _limit,
      );
    result.fold(
      (failure) => emit(PatientDoctorsListFailure(failure: failure)),
      (doctors) {
        _doctors.clear();
        _doctors.addAll(doctors);
        _hasMore = doctors.length == _limit;
        emit(PatientDoctorsListSuccess(doctors: _doctors));
      },
    );
  }

  Future<void> _onGetMoreDoctors(
    GetMoreDoctors event,
    Emitter<PatientDoctorsListState> emit,
  ) async {
    if (_hasMore) {
      return;
    }

    final nextPage = _page + 1;

    emit(PatientDoctorsListPaginationLoading());
    final result =
        await _patientHomeRepo.getDoctors(
        filter: _currentFilter!,
        page: nextPage,
        limit: _limit,
      );
    result.fold(
      (failure) => emit(PatientDoctorsListPaginationFailure(failure: failure)),
      (doctors) {
        _doctors.addAll(doctors);
        _page = nextPage;
        _hasMore = doctors.length == _limit;
        emit(PatientDoctorsListSuccess(doctors: _doctors));
      },
    );
  }
}
