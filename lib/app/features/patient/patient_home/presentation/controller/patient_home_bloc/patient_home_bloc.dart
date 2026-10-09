import 'package:doctor_hunt/app/features/patient/patient_home/data/repos/patient_home_repo.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/params/doctors_filter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'patient_home_event.dart';
part 'patient_home_state.dart';

@injectable
class PatientHomeBloc extends Bloc<PatientHomeEvent, PatientHomeState> {
  final PatientHomeRepo _repo;

  PatientHomeBloc(this._repo) : super(PatientHomeInitial()) {
    on<GetHomeDoctors>(_onGetHomeDoctors);
    on<LoadMorePopularDoctors>(_onLoadMorePopularDoctors);
    on<LoadMoreTopRatedDoctors>(_onLoadMoreTopRatedDoctors);
  }

  int _popularPage = 1;
  int _topRatedPage = 1;

  final int _limit = 10;

  bool _hasMorePopular = true;
  bool _hasMoreTopRated = true;

  Map<String, DoctorModel> _popularDoctors = {};
  Map<String, DoctorModel> _topRatedDoctors = {};

  List<DoctorModel> get popularDoctors => _popularDoctors.values.toList();
  List<DoctorModel> get topRatedDoctors => _topRatedDoctors.values.toList();

  Future<void> _onGetHomeDoctors(
    GetHomeDoctors event,
    Emitter<PatientHomeState> emit,
  ) async {
    _popularPage = 1;
    _topRatedPage = 1;
    _hasMorePopular = true;
    _hasMoreTopRated = true;
    
    emit(PatientHomeLoading());

     final results = await Future.wait([
      _repo.getDoctors(
        page: _popularPage,
        limit: _limit,
        filter: const DoctorsFilter(type: DoctorsListType.popular),
      ),
      _repo.getDoctors(
        page: _topRatedPage,
        limit: _limit,
        filter: const DoctorsFilter(type: DoctorsListType.topRated),
      ),
    ]);

    Failure? failure;

    final popularResult = results.first;
    final topRatedResult = results.last;

    popularResult.fold(
      (f) => failure = f,
      (newDoctors) {
        _popularDoctors = {for (var doctor in newDoctors) doctor.id: doctor};
        _hasMorePopular = newDoctors.length == _limit;
      },
    );

    topRatedResult.fold(
      (f) => failure = f,
      (newDoctors) {
        _topRatedDoctors = {for (var doctor in newDoctors) doctor.id: doctor};
        _hasMoreTopRated = newDoctors.length == _limit;
      },
    );

    if (failure != null) {
      return emit(PatientHomeFailure(failure!));
    }

    emit(PatientHomeSuccess(
      popularDoctors: popularDoctors,
      topRatedDoctors: topRatedDoctors,
    ));
  }

  Future<void> _onLoadMorePopularDoctors(
    LoadMorePopularDoctors event,
    Emitter<PatientHomeState> emit,
  ) async {
    if (!_hasMorePopular) {
      return;
    }

    final nextPage = _popularPage + 1;

    emit(PatientMorePopularLoading());

    final result = await _repo.getDoctors(
      page: nextPage,
      limit: _limit,
      filter: const DoctorsFilter(type: DoctorsListType.popular),
    );

    result.fold(
      (failure) => emit(PatientHomePaginationFailure(failure)),
      (newDoctors) {
        _popularPage++;
        _popularDoctors.addAll({for (var doctor in newDoctors) doctor.id: doctor});
        _hasMorePopular = newDoctors.length == _limit;

        emit(PatientHomeSuccess(
          popularDoctors: popularDoctors,
          topRatedDoctors: topRatedDoctors,
        ));
      },
    );
  }

  Future<void> _onLoadMoreTopRatedDoctors(
    LoadMoreTopRatedDoctors event,
    Emitter<PatientHomeState> emit,
  ) async {
    if (!_hasMoreTopRated) {
      return;
    }

    final nextPage = _topRatedPage + 1;

    emit(PatientMoreTopRatedLoading());

    final result = await _repo.getDoctors(
      page: nextPage,
      limit: _limit,
      filter: const DoctorsFilter(type: DoctorsListType.topRated),
    );

    result.fold(
      (failure) => emit(PatientHomePaginationFailure(failure)),
      (newDoctors) {
        _topRatedPage++;
        _topRatedDoctors.addAll({for (var doctor in newDoctors) doctor.id: doctor});
        _hasMoreTopRated = newDoctors.length == _limit;

        emit(PatientHomeSuccess(
          popularDoctors: popularDoctors,
          topRatedDoctors: topRatedDoctors,
        ));
      },
    );
  }


}
