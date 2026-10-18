import 'package:bloc_concurrency/bloc_concurrency.dart';
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
  final PatientAppointmentsRepo _appointmentsRepo;

  PatientAppointmentsBloc(this._appointmentsRepo)
    : super(PatientAppointmentsInitial()) {
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
  }

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

    final result = await _appointmentsRepo.getPatientAppointments(
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

    final result = await _appointmentsRepo.getPatientAppointments(
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
}
