import 'dart:async';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:doctor_hunt/app/core/app_events/app_event_bus.dart';
import 'package:doctor_hunt/app/core/app_events/app_events.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/enums/appointment_status.dart';
import 'package:doctor_hunt/app/core/shared/models/appointment_model.dart';
import 'package:doctor_hunt/app/features/admin/admin_appointments/data/repos/admin_appointments_repo.dart';
import 'package:doctor_hunt/app/features/common/appointments/data/repos/appointments_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'admin_appointments_event.dart';
part 'admin_appointments_state.dart';

@injectable
class AdminAppointmentsBloc
    extends Bloc<AdminAppointmentsEvent, AdminAppointmentsState> {
  final AdminAppointmentsRepo _adminAppointmentsRepo;
  final AppointmentsRepo _appointmentsRepo;
  final AppEventBus _appEventBus;

  AdminAppointmentsBloc(
    this._adminAppointmentsRepo,
    this._appEventBus,
    this._appointmentsRepo,
  ) : super(AdminAppointmentsInitial()) {
    on<GetAdminAppointmentsEvent>(
      _onGetAdminAppointments,
      transformer: restartable(),
    );
    on<GetMoreAdminAppointmentsEvent>(
      _onGetMoreAppointments,
      transformer: droppable(),
    );
    on<ChangeAppointmentStatusEvent>(
      _onChangeAppointmentStatus,
      transformer: restartable(),
    );
    on<CancelAppointmentFromDetailsEvent>(_onCancelOrCompleteAppointmentFromDetails);
    on<AdminCancelAppointmentEvent>(_onCancelAppointment);
    on<AdminCompleteAppointmentEvent>(_onCompleteAppointment);

    _cancelAppointmentSubscription = _appEventBus
        .on<CancelAppointmentEvent>()
        .listen(
          (event) => add(
            CancelAppointmentFromDetailsEvent(
              appointmentId: event.appointmentId,
            ),
          ),
        );

    _completeAppointmentSubscription = _appEventBus
        .on<CompleteAppointmentEvent>()
        .listen(
          (event) => add(
            CancelAppointmentFromDetailsEvent(
              appointmentId: event.appointmentId,
            ),
          ),
        );
  }

  late final StreamSubscription<CancelAppointmentEvent> _cancelAppointmentSubscription;
  late final StreamSubscription<CompleteAppointmentEvent> _completeAppointmentSubscription;

  AppointmentStatus _status = AppointmentStatus.upcoming;
  AppointmentStatus get status => _status;

  final Map<String, AppointmentModel> _appointments = {};
  List<AppointmentModel> get appointments => _appointments.values.toList();

  int _page = 1;
  final int _limit = 10;
  bool _hasMore = true;

  void _onChangeAppointmentStatus(
    ChangeAppointmentStatusEvent event,
    Emitter<AdminAppointmentsState> emit,
  ) {
    if (_status == event.status) return;

    _status = event.status;
    _appointments.clear();
    _page = 1;
    _hasMore = true;

    add(const GetAdminAppointmentsEvent());
  }

  Future<void> _onGetAdminAppointments(
    GetAdminAppointmentsEvent event,
    Emitter<AdminAppointmentsState> emit,
  ) async {
    emit(GetAdminAppointmentsLoading());

    final result = await _adminAppointmentsRepo.getAdminAppointments(
      status: status,
      limit: _limit,
      page: _page,
    );

    result.fold(
      (failure) {
        emit(GetAdminAppointmentsFailure(failure: failure));
      },
      (newAppointments) {
        _hasMore = newAppointments.length == _limit;
        for (final a in newAppointments) {
          _appointments[a.id] = a;
        }
        emit(GetAdminAppointmentsSuccess(appointments: appointments));
      },
    );
  }

  Future<void> _onGetMoreAppointments(
    GetMoreAdminAppointmentsEvent event,
    Emitter<AdminAppointmentsState> emit,
  ) async {
    if (!_hasMore || state is GetAdminAppointmentsPaginationLoading) return;
    final nextPage = _page + 1;

    emit(GetAdminAppointmentsPaginationLoading());

    final result = await _adminAppointmentsRepo.getAdminAppointments(
      status: status,
      limit: _limit,
      page: nextPage,
    );

    result.fold(
      (failure) {
        emit(
          GetAdminAppointmentsPaginationFailure(
            failure: failure,
          ),
        );
      },
      (newAppointments) {
        _page = nextPage;
        _hasMore = newAppointments.length == _limit;

        for (final appointment in newAppointments) {
          _appointments[appointment.id] = appointment;
        }

        emit(
          GetAdminAppointmentsSuccess(
            appointments: appointments,
          ),
        );
      },
    );
  }

  Future<void> _onCancelAppointment(
    AdminCancelAppointmentEvent event,
    Emitter<AdminAppointmentsState> emit,
  ) async {
    emit(AdminAppointmentsActionLoading());

    final result = await _appointmentsRepo.cancelAppointment(
      event.appointmentId,
    );

    result.fold(
      (failure) {
        emit(AdminAppointmentsActionFailure(failure: failure));
      },
      (_) {
        _appointments.remove(event.appointmentId);
        emit(AdminAppointmentsCanceledSuccess());
      },
    );
  }

  Future<void> _onCompleteAppointment(
    AdminCompleteAppointmentEvent event,
    Emitter<AdminAppointmentsState> emit,
  ) async {
    emit(AdminAppointmentsActionLoading());

    final result = await _appointmentsRepo.markAppointmentAsCompleted(
      event.appointmentId,
    );

    result.fold(
      (failure) {
        emit(AdminAppointmentsActionFailure(failure: failure));
      },
      (_) {
        _appointments.remove(event.appointmentId);
        emit(AdminAppointmentsCompletedSuccess());
      },
    );
  }

  void _onCancelOrCompleteAppointmentFromDetails(
    CancelAppointmentFromDetailsEvent event,
    Emitter<AdminAppointmentsState> emit,
  ) {
    _appointments.remove(event.appointmentId);

    emit(GetAdminAppointmentsSuccess(appointments: appointments));
  }

  @override
  Future<void> close() {
    _cancelAppointmentSubscription.cancel();
    _completeAppointmentSubscription.cancel();
    return super.close();
  }
}
