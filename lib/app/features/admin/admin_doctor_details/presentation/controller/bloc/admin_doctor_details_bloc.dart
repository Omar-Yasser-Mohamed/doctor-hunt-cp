import 'dart:async';
import 'package:doctor_hunt/app/core/app_events/app_event_bus.dart';
import 'package:doctor_hunt/app/core/app_events/app_events.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_details/data/repos/admin_doctor_details_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'admin_doctor_details_event.dart';
part 'admin_doctor_details_state.dart';

@injectable
class AdminDoctorDetailsBloc
    extends Bloc<AdminDoctorDetailsEvent, AdminDoctorDetailsState> {
  final AdminDoctorDetailsRepo _adminDoctorDetailsRepo;
  final AppEventBus _appEventBus;

  AdminDoctorDetailsBloc(this._adminDoctorDetailsRepo, this._appEventBus)
    : super(AdminDoctorDetailsInitial()) {
    on<GetDoctorDetailsEvent>(_onGetDoctorDetails);
    on<DoctorUpdatedDetailsEvent>(_onDoctorUpdated);

    _doctorUpdatedSubscription = _appEventBus.on<DoctorUpdatedEvent>().listen(
      (event) => add(DoctorUpdatedDetailsEvent(doctor: event.doctor)),
    );
  }

  late final StreamSubscription<DoctorUpdatedEvent> _doctorUpdatedSubscription;

  Future<void> _onGetDoctorDetails(
    GetDoctorDetailsEvent event,
    Emitter<AdminDoctorDetailsState> emit,
  ) async {
    emit(AdminDoctorDetailsLoading());

    final result = await _adminDoctorDetailsRepo.getDoctorDetails(
      doctorId: event.doctorId,
    );

    result.fold(
      (failure) => emit(AdminDoctorDetailsFailure(failure: failure)),
      (doctor) => emit(AdminDoctorDetailsSuccess(doctor: doctor)),
    );
  }

  void _onDoctorUpdated(
    DoctorUpdatedDetailsEvent event,
    Emitter<AdminDoctorDetailsState> emit,
  ) {
    emit(AdminDoctorDetailsSuccess(doctor: event.doctor));
  }

  @override
  Future<void> close() {
    _doctorUpdatedSubscription.cancel();
    return super.close();
  }
}
