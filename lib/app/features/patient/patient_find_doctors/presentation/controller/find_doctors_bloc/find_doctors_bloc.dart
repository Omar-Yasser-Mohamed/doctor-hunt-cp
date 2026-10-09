import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/controller/admin_doctors_bloc/admin_doctors_bloc.dart';
import 'package:doctor_hunt/app/features/patient/patient_find_doctors/data/repo/patient_find_doctors_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'find_doctors_event.dart';
part 'find_doctors_state.dart';

@injectable
class FindDoctorsBloc extends Bloc<FindDoctorsEvent, FindDoctorsState> {
  final PatientFindDoctorsRepo _findDoctorsRepo;

  FindDoctorsBloc(this._findDoctorsRepo) : super(FindDoctorsInitial()) {
    on<SearchForDoctorsEvent>(
      _onSearchForDoctors,
      transformer: searchTransformer(),
    );
    on<ClearSearchEvent>(_onClearSearch);
    on<LoadMoreDoctorsEvent>(_onLoadMoreDoctors);
  }

  final Map<String, DoctorModel> _doctors = {};
  List<DoctorModel> get doctors => _doctors.values.toList();

  int _page = 1;
  final int _limit = 10;
  bool _hasMore = true;

  String? _query;

  Future<void> _onSearchForDoctors(
    SearchForDoctorsEvent event,
    Emitter<FindDoctorsState> emit,
  ) async {
    _resetSearch();
    if (event.query.isEmpty) {
      emit(FindDoctorsInitial());
      return;
    }

    emit(FindDoctorsLoading());

    final result = await _findDoctorsRepo.searchForDoctors(
      query: event.query,
      page: _page,
      limit: _limit,
    );

    result.fold(
      (failure) => emit(FindDoctorsFailure(failure: failure)),
      (newDoctors) {
        for (var doctor in newDoctors) {
          _doctors[doctor.id] = doctor;
        }
        _hasMore = newDoctors.length == _limit;
        emit(FindDoctorsSuccess(doctors: _doctors.values.toList()));
      },
    );
  }

  Future<void> _onClearSearch(
    ClearSearchEvent event,
    Emitter<FindDoctorsState> emit,
  ) async {
    _resetSearch();
    emit(FindDoctorsInitial());
  }

  void _resetSearch() {
    _query = null;
    _page = 1;
    _hasMore = true;
    _doctors.clear();
  }

  Future<void> _onLoadMoreDoctors(
    LoadMoreDoctorsEvent event,
    Emitter<FindDoctorsState> emit,
  ) async {
    if (!_hasMore || _query == null) {
      return;
    }

    final nextPage = _page + 1;
    emit(FindDoctorsPaginationLoading());

    final result = await _findDoctorsRepo.searchForDoctors(
      query: _query!,
      page: nextPage,
      limit: _limit,
    );

    result.fold(
      (failure) => emit(FindDoctorsPaginationFailure(failure: failure)),
      (newDoctors) {
        _page = nextPage;
        for (var doctor in newDoctors) {
          _doctors[doctor.id] = doctor;
        }
        _hasMore = newDoctors.length == _limit;
        emit(FindDoctorsSuccess(doctors: _doctors.values.toList()));
      },
    );
  }
}
