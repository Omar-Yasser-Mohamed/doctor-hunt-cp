import 'dart:async';

import 'package:doctor_hunt/app/core/app_events/app_event_bus.dart';
import 'package:doctor_hunt/app/core/app_events/app_events.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/data/models/doctors_stats.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/data/repos/admin_doctors_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_hunt/app/core/shared/enums/doctor_specialty.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'admin_doctors_event.dart';
part 'admin_doctors_state.dart';

@injectable
class AdminDoctorsBloc extends Bloc<AdminDoctorsEvent, AdminDoctorsState> {
  final AdminDoctorsRepo _adminDoctorsRepo;
  final AppEventBus _appEventBus;

  AdminDoctorsBloc(this._adminDoctorsRepo, this._appEventBus)
    : super(AdminDoctorsInitial()) {
    on<ChangeSpecialtyEvent>(_onChangeSpecialty);
    on<LoadAdminDoctorsEvent>(_onLoadAdminDoctors);
    on<LoadMoreDoctorsEvent>(_onLoadMoreDoctors);
    on<SearchDoctorsEvent>(_onSearchDoctors);
    on<DoctorCreatedBlocEvent>(_onDoctorCreated);
    on<DoctorUpdatedBlocEvent>(_onDoctorUpdated);
    on<DoctorDeletedBlocEvent>(_onDoctorDeleted);

    _doctorCreatedSubscription = _appEventBus.on<DoctorCreatedEvent>().listen(
      (event) => add(DoctorCreatedBlocEvent(doctor: event.doctor)),
    );
    _doctorUpdatedSubscription = _appEventBus.on<DoctorUpdatedEvent>().listen(
      (event) => add(DoctorUpdatedBlocEvent(doctor: event.doctor)),
    );
    _doctorDeletedSubscription = _appEventBus.on<DoctorDeletedEvent>().listen(
      (event) => add(DoctorDeletedBlocEvent(doctorId: event.doctorId)),
    );
  }

  late final StreamSubscription<DoctorCreatedEvent> _doctorCreatedSubscription;
  late final StreamSubscription<DoctorUpdatedEvent> _doctorUpdatedSubscription;
  late final StreamSubscription<DoctorDeletedEvent> _doctorDeletedSubscription;

  String? _search;
  int _page = 1;
  final int _limit = 10;
  bool _hasMore = true;

  Map<String, DoctorModel> _doctors = {};
  List<DoctorModel> get doctors => _doctors.values.toList();

  DoctorSpecialty? _specialty;
  DoctorSpecialty? get specialty => _specialty;

  DoctorsStats _stats = const DoctorsStats(totalDoctors: 0, activeDoctors: 0);
  DoctorsStats get stats => _stats;

  Map<String, int> _specialtyCounts = {};
  Map<String, int> get specialtyCounts => _specialtyCounts;

  Future<void> _onChangeSpecialty(
    ChangeSpecialtyEvent event,
    Emitter<AdminDoctorsState> emit,
  ) async {
    if (event.specialty == _specialty) return;
    _specialty = event.specialty;

    await _onFetchDoctors(emit);
  }

  Future<void> _onLoadAdminDoctors(
    LoadAdminDoctorsEvent event,
    Emitter<AdminDoctorsState> emit,
  ) async {
    _resetDoctorsPagination();
    emit(AdminDoctorsLoading());

    final results = await Future.wait([
      _adminDoctorsRepo.getDoctorStats(),
      _adminDoctorsRepo.getSpecialtyCounts(),
      _adminDoctorsRepo.getDoctors(
        search: _search,
        specialty: _specialty,
        page: _page,
        limit: _limit,
      ),
    ]);

    final statsResult = results[0] as Either<Failure, DoctorsStats>;

    final specialtyCountsResult =
        results[1] as Either<Failure, Map<String, int>>;

    final doctorsResult = results[2] as Either<Failure, List<DoctorModel>>;

    Failure? failure;

    statsResult.fold(
      (value) => failure = value,
      (value) => _stats = value,
    );

    specialtyCountsResult.fold(
      (value) => failure ??= value,
      (value) => _specialtyCounts = value,
    );

    doctorsResult.fold(
      (value) => failure ??= value,
      (value) {
        _doctors = {
          for (final doctor in value) doctor.id: doctor,
        };
      },
    );

    if (failure != null) {
      emit(AdminDoctorsFailure(failure: failure!));

      return;
    }

    _hasMore = doctors.length == _limit;

    emit(
      AdminDoctorsSuccess(
        stats: stats,
        specialtyCounts: specialtyCounts,
        doctors: doctors,
      ),
    );
  }

  Future<void> _onSearchDoctors(
    SearchDoctorsEvent event,
    Emitter<AdminDoctorsState> emit,
  ) async {
    if (event.search == _search) return;
    _search = event.search;

    await _onFetchDoctors(emit);
  }

  Future<void> _onFetchDoctors(Emitter<AdminDoctorsState> emit) async {
    _resetDoctorsPagination();
    emit(AdminDoctorsListLoading());

    final result = await _adminDoctorsRepo.getDoctors(
      page: _page,
      search: _search,
      limit: _limit,
      specialty: _specialty,
    );

    result.fold(
      (failure) => emit(AdminDoctorsFailure(failure: failure)),
      (newDoctors) {
        _doctors = {
          for (final doctor in newDoctors) doctor.id: doctor,
        };
        _hasMore = doctors.length == _limit;
        emit(
          AdminDoctorsSuccess(
            stats: stats,
            specialtyCounts: specialtyCounts,
            doctors: doctors,
          ),
        );
      },
    );
  }

  Future<void> _onLoadMoreDoctors(
    LoadMoreDoctorsEvent event,
    Emitter<AdminDoctorsState> emit,
  ) async {
    if (!_hasMore) return;
    final nextPage = _page + 1;

    emit(AdminDoctorsPaginationLoading());

    final result = await _adminDoctorsRepo.getDoctors(
      search: _search,
      specialty: _specialty,
      page: nextPage,
      limit: _limit,
    );

    result.fold(
      (value) => emit(AdminDoctorsPaginationFailure(failure: value)),
      (newDoctors) {
        _page = nextPage;
        _hasMore = newDoctors.length == _limit;
        _doctors.addAll({
          for (final doctor in newDoctors) doctor.id: doctor,
        });
        emit(
          AdminDoctorsSuccess(
            stats: _stats,
            specialtyCounts: _specialtyCounts,
            doctors: _doctors.values.toList(),
          ),
        );
      },
    );
  }

  void _resetDoctorsPagination() {
    _page = 1;
    _hasMore = true;
    _doctors.clear();
  }

  void _onDoctorCreated(
    DoctorCreatedBlocEvent event,
    Emitter<AdminDoctorsState> emit,
  ) {
    final doctor = event.doctor;

    _doctors[doctor.id] = doctor;

    _stats = _stats.copyWith(
      totalDoctors: _stats.totalDoctors + 1,
      activeDoctors: doctor.isActive
          ? _stats.activeDoctors + 1
          : _stats.activeDoctors,
    );

    _incrementSpecialtyCount(doctor.specialty);

    emit(
      AdminDoctorsSuccess(
        stats: _stats,
        specialtyCounts: _specialtyCounts,
        doctors: _doctors.values.toList(),
      ),
    );
  }

  void _onDoctorUpdated(
    DoctorUpdatedBlocEvent event,
    Emitter<AdminDoctorsState> emit,
  ) {
    final doctor = event.doctor;
    final oldDoctor = _doctors[doctor.id];
    _doctors[doctor.id] = doctor;

    if (oldDoctor != null) {
      int activeDiff = 0;
      if (oldDoctor.isActive && !doctor.isActive) activeDiff = -1;
      if (!oldDoctor.isActive && doctor.isActive) activeDiff = 1;
      _stats = _stats.copyWith(
        activeDoctors: _stats.activeDoctors + activeDiff,
      );

      if (oldDoctor.specialty != doctor.specialty) {
        _decrementSpecialtyCount(oldDoctor.specialty);
        _incrementSpecialtyCount(doctor.specialty);
      }
    }

    emit(
      AdminDoctorsSuccess(
        stats: _stats,
        specialtyCounts: _specialtyCounts,
        doctors: _doctors.values.toList(),
      ),
    );
  }

  void _onDoctorDeleted(
    DoctorDeletedBlocEvent event,
    Emitter<AdminDoctorsState> emit,
  ) {
    final oldDoctor = _doctors.remove(event.doctorId);
    if (oldDoctor != null) {
      final newTotal = _stats.totalDoctors > 0 ? _stats.totalDoctors - 1 : 0;
      final newActive = oldDoctor.isActive && _stats.activeDoctors > 0
          ? _stats.activeDoctors - 1
          : _stats.activeDoctors;
      _stats = _stats.copyWith(
        totalDoctors: newTotal,
        activeDoctors: newActive,
      );

      _decrementSpecialtyCount(oldDoctor.specialty);
    }

    emit(
      AdminDoctorsSuccess(
        stats: _stats,
        specialtyCounts: _specialtyCounts,
        doctors: _doctors.values.toList(),
      ),
    );
  }

  void _incrementSpecialtyCount(DoctorSpecialty specialty) {
    _specialtyCounts = Map<String, int>.from(_specialtyCounts);
    final key = specialty.name;
    _specialtyCounts[key] = (_specialtyCounts[key] ?? 0) + 1;
  }

  void _decrementSpecialtyCount(DoctorSpecialty specialty) {
    _specialtyCounts = Map<String, int>.from(_specialtyCounts);
    final key = specialty.name;
    final current = _specialtyCounts[key] ?? 0;
    _specialtyCounts[key] = current > 0 ? current - 1 : 0;
  }

  @override
  Future<void> close() {
    _doctorCreatedSubscription.cancel();
    _doctorUpdatedSubscription.cancel();
    _doctorDeletedSubscription.cancel();
    return super.close();
  }
}

