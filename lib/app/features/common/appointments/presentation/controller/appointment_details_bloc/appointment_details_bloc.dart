import 'package:doctor_hunt/app/core/app_events/app_event_bus.dart';
import 'package:doctor_hunt/app/core/app_events/app_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/appointment_model.dart';
import 'package:doctor_hunt/app/features/common/appointments/data/repos/appointments_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'appointment_details_event.dart';
part 'appointment_details_state.dart';

@injectable
class AppointmentDetailsBloc
    extends Bloc<AppointmentDetailsEvent, AppointmentDetailsState> {
  final AppointmentsRepo _appointmentsRepo;
  final AppEventBus _appEventBus;

  AppointmentDetailsBloc(this._appointmentsRepo, this._appEventBus)
    : super(AppointmentDetailsInitial()) {
    on<GetAppointmentDetailsEvent>(_getAppointmentDetails);
    on<CancelAppointmentFromDetailsEvent>(_onCancelAppointment);
  }

  late AppointmentModel _appointment;
  AppointmentModel get appointment => _appointment;

  Future<void> _getAppointmentDetails(
    GetAppointmentDetailsEvent event,
    Emitter<AppointmentDetailsState> emit,
  ) async {
    emit(AppointmentDetailsLoading());

    final result = await _appointmentsRepo.getAppointmentDetails(
      event.appointmentId,
    );

    result.fold(
      (failure) => emit(AppointmentDetailsFailure(failure: failure)),
      (appointmentDetails) {
        _appointment = appointmentDetails;
        emit(AppointmentDetailsSuccess(appointment: appointmentDetails));
      },
    );
  }

  Future<void> _onCancelAppointment(
    CancelAppointmentFromDetailsEvent event,
    Emitter<AppointmentDetailsState> emit,
  ) async {
    emit(AppointmentDetailsActionLoading());

    final result = await _appointmentsRepo.cancelAppointment(
      event.appointmentId,
    );

    result.fold(
      (failure) => emit(AppointmentDetailsActionFailure(failure: failure)),
      (appointmentDetails) {
        _appEventBus.fire(CancelAppointmentEvent(appointmentId: event.appointmentId));
        emit(AppointmentCanceledSuccess());
      },
    );
  }
}
