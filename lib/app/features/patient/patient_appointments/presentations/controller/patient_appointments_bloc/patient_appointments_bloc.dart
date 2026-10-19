import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:doctor_hunt/app/core/app_events/app_event_bus.dart';
import 'package:doctor_hunt/app/core/app_events/app_events.dart';
import 'package:doctor_hunt/app/features/common/appointments/data/repos/appointments_repo.dart';
import 'package:doctor_hunt/app/features/patient/patient_appointments/data/models/create_appointment_review.dart';
import 'package:doctor_hunt/app/features/patient/patient_appointments/data/repos/patient_appointments_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/enums/appointment_status.dart';
import 'package:doctor_hunt/app/core/shared/models/appointment_model.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'patient_appointments_event.dart';
part 'patient_appointments_state.dart';

@injectable
class PatientAppointmentsBloc
    extends Bloc<PatientAppointmentsEvent, PatientAppointmentsState> {
  final PatientAppointmentsRepo _patientAppointmentsRepo;
  final AppointmentsRepo _appointmentsRepo;
  final AppEventBus _appEventBus;

  PatientAppointmentsBloc(
    this._patientAppointmentsRepo,
    this._appEventBus,
    this._appointmentsRepo,
  ) : super(PatientAppointmentsInitial()) {
    on<GetPatientAppointmentsEvent>(
      _onGetPatientAppointments,
      transformer: restartable(),
    );
    on<GetMorePatientAppointmentsEvent>(
      _onGetMoreAppointments,
      transformer: droppable(),
    );
    on<ChangeAppointmentStatusTabEvent>(
      _onChangeAppointmentStatus,
      transformer: restartable(),
    );
    on<PatientCancelAppointmentEvent>(_onCancelAppointment);
    on<CancelAppointmentFromDetailsEvent>(_onCancelAppointmentFromDetails);
    on<SubmitAppointmentReviewEvent>(_onSubmitAppointmentReview);

    _cancelAppointmentSubscription = _appEventBus
        .on<CancelAppointmentEvent>()
        .listen(
          (event) => add(
            CancelAppointmentFromDetailsEvent(
              appointmentId: event.appointmentId,
            ),
          ),
        );
  }

  late final StreamSubscription<CancelAppointmentEvent>
  _cancelAppointmentSubscription;

  AppointmentStatus _status = AppointmentStatus.upcoming;
  AppointmentStatus get status => _status;

  final Map<String, AppointmentModel> _appointments = {};
  List<AppointmentModel> get appointments => _appointments.values.toList();

  int _page = 1;
  final int _limit = 10;
  bool _hasMore = true;

  void _onChangeAppointmentStatus(
    ChangeAppointmentStatusTabEvent event,
    Emitter<PatientAppointmentsState> emit,
  ) {
    if (_status == event.status) return;

    _status = event.status;
    _appointments.clear();
    _page = 1;
    _hasMore = true;

    add(const GetPatientAppointmentsEvent());
  }

  Future<void> _onGetPatientAppointments(
    GetPatientAppointmentsEvent event,
    Emitter<PatientAppointmentsState> emit,
  ) async {
    emit(GetPatientAppointmentsLoading());

    final result = await _patientAppointmentsRepo.getPatientAppointments(
      status: status,
      limit: _limit,
      page: _page,
    );

    result.fold(
      (failure) {
        emit(GetPatientAppointmentsFailure(failure: failure));
      },
      (newAppointments) {
        _hasMore = newAppointments.length == _limit;
        for (final a in newAppointments) {
          _appointments[a.id] = a;
        }
        emit(GetPatientAppointmentsSuccess(appointments: appointments));
      },
    );
  }

  Future<void> _onGetMoreAppointments(
    GetMorePatientAppointmentsEvent event,
    Emitter<PatientAppointmentsState> emit,
  ) async {
    if (!_hasMore) return;
    final nextPage = _page + 1;

    emit(GetPatientAppointmentsPaginationLoading());

    final result = await _patientAppointmentsRepo.getPatientAppointments(
      status: status,
      limit: _limit,
      page: nextPage,
    );

    result.fold(
      (failure) {
        emit(
          GetPatientAppointmentsPaginationFailure(
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
          GetPatientAppointmentsSuccess(
            appointments: appointments,
          ),
        );
      },
    );
  }

  Future<void> _onCancelAppointment(
    PatientCancelAppointmentEvent event,
    Emitter<PatientAppointmentsState> emit,
  ) async {
    emit(PatientAppointmentsActionLoading());

    final result = await _appointmentsRepo.cancelAppointment(
      event.appointmentId,
    );

    result.fold(
      (failure) {
        emit(PatientAppointmentsActionFailure(failure: failure));
      },
      (_) {
        _appointments.remove(event.appointmentId);
        emit(PatientAppointmentsCanceledSuccess());
      },
    );
  }

  Future<void> _onSubmitAppointmentReview(
    SubmitAppointmentReviewEvent event,
    Emitter<PatientAppointmentsState> emit,
  ) async {
    emit(PatientAppointmentsActionLoading());

    final result = await _patientAppointmentsRepo.createAppointmentReview(
      CreateAppointmentReviewRequest(
        appointmentId: event.appointmentId,
        rating: event.rating,
        review: event.review,
      ),
    );

    result.fold(
      (failure) {
        emit(PatientAppointmentsActionFailure(failure: failure));
      },
      (appointment) {
        _appointments[appointment.id] = appointment;
        emit(SubmitAppointmentReviewSuccess(appointment: appointment));
      },
    );
  }

  void _onCancelAppointmentFromDetails(
    CancelAppointmentFromDetailsEvent event,
    Emitter<PatientAppointmentsState> emit,
  ) {
    _appointments.remove(event.appointmentId);

    emit(GetPatientAppointmentsSuccess(appointments: appointments));
  }

  @override
  Future<void> close() {
    _cancelAppointmentSubscription.cancel();
    return super.close();
  }
}
