import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/error/failure_code.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_availability_model.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_hunt/app/core/shared/enums/week_day.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_availability/data/models/update_doctor_availability.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_availability/data/repos/admin_doctor_availability_repo.dart';
import 'package:injectable/injectable.dart';

part 'doctor_availability_event.dart';
part 'doctor_availability_state.dart';

@injectable
class DoctorAvailabilityBloc
    extends Bloc<DoctorAvailabilityEvent, DoctorAvailabilityState> {
  final AdminDoctorAvailabilityRepo _repo;

  DoctorAvailabilityBloc(this._repo) : super(const DoctorAvailabilityState()) {
    on<GetDoctorAvailabilityEvent>(_onGetDoctorAvailability);
    on<ToggleWorkingDayEvent>(_onToggleWorkingDay);
    on<ChangeStartTimeEvent>(_onChangeStartTime);
    on<ChangeEndTimeEvent>(_onChangeEndTime);
    on<ChangeSlotDurationEvent>(_onChangeSlotDuration);
    on<SaveDoctorAvailabilityEvent>(_onSaveDoctorAvailability);
  }

  String? _doctorId;

  Future<void> _onGetDoctorAvailability(
    GetDoctorAvailabilityEvent event,
    Emitter<DoctorAvailabilityState> emit,
  ) async {
    _doctorId = event.doctorId;
    emit(GetDoctorAvailabilityLoading());

    final result = await _repo.getDoctorAvailability(event.doctorId);

    result.fold(
      (failure) => emit(
        GetDoctorAvailabilityFailure(failure: failure),
      ),
      (availability) {
        emit(
          GetDoctorAvailabilitySuccess(
            originalAvailability: availability,
            updatedAvailability: availability,
          ),
        );
      },
    );
  }

  void _onToggleWorkingDay(
    ToggleWorkingDayEvent event,
    Emitter<DoctorAvailabilityState> emit,
  ) {
    final currentDays = List<WeekDay>.from(
      state.updatedAvailability!.workingDays,
    );

    if (currentDays.contains(event.day)) {
      currentDays.remove(event.day);
    } else {
      currentDays.add(event.day);
    }

    final updated = state.updatedAvailability!.copyWith(
      workingDays: currentDays,
    );

    emit(
      DoctorAvailabilityEditing(
        originalAvailability: state.originalAvailability,
        updatedAvailability: updated,
      ),
    );
  }

  void _onChangeStartTime(
    ChangeStartTimeEvent event,
    Emitter<DoctorAvailabilityState> emit,
  ) {
    final updated = state.updatedAvailability?.copyWith(
      startTime: event.startTime,
    );

    emit(
      DoctorAvailabilityEditing(
        originalAvailability: state.originalAvailability,
        updatedAvailability: updated,
      ),
    );
  }

  void _onChangeEndTime(
    ChangeEndTimeEvent event,
    Emitter<DoctorAvailabilityState> emit,
  ) {
    final updated = state.updatedAvailability?.copyWith(
      endTime: event.endTime,
    );

    emit(
      DoctorAvailabilityEditing(
        originalAvailability: state.originalAvailability,
        updatedAvailability: updated,
      ),
    );
  }

  void _onChangeSlotDuration(
    ChangeSlotDurationEvent event,
    Emitter<DoctorAvailabilityState> emit,
  ) {
    final updated = state.updatedAvailability?.copyWith(
      slotDuration: event.slotDuration,
    );

    emit(
      DoctorAvailabilityEditing(
        originalAvailability: state.originalAvailability,
        updatedAvailability: updated,
      ),
    );
  }

  Future<void> _onSaveDoctorAvailability(
    SaveDoctorAvailabilityEvent event,
    Emitter<DoctorAvailabilityState> emit,
  ) async {
    if (_doctorId == null || !state.hasChanges) return;

    final isValid = _validateChanges(emit);
    if (!isValid) return;

    emit(
      SaveDoctorAvailabilityLoading(
        originalAvailability: state.originalAvailability,
        updatedAvailability: state.updatedAvailability,
      ),
    );

    final request = UpdateDoctorAvailabilityRequest(
      workingDays: state.updatedAvailability!.workingDays,
      startTime: state.updatedAvailability!.startTime,
      endTime: state.updatedAvailability!.endTime,
      slotDuration: state.updatedAvailability!.slotDuration,
    );

    final result = await _repo.updateDoctorAvailability(
      doctorId: _doctorId!,
      request: request,
    );

    result.fold(
      (failure) => emit(
        SaveDoctorAvailabilityFailure(
          originalAvailability: state.originalAvailability,
          updatedAvailability: state.updatedAvailability,
          failure: failure,
        ),
      ),
      (updatedAvailability) => emit(
        SaveDoctorAvailabilitySuccess(
          originalAvailability: updatedAvailability,
          updatedAvailability: updatedAvailability,
        ),
      ),
    );
  }

  bool _validateChanges(Emitter<DoctorAvailabilityState> emit) {
    final availability = state.updatedAvailability!;
    if (availability.startTime.isAfter(availability.endTime)) {
      emit(
        SaveDoctorAvailabilityFailure(
          updatedAvailability: state.updatedAvailability,
          originalAvailability: state.originalAvailability,
          failure: AppFailure(
            message: t.slotDurationMustBeBeforeEndTime,
            code: FailureCode.invalidData,
          ),
        ),
      );
      return false;
    }
    if (availability.workingDays.isEmpty) {
      emit(
        SaveDoctorAvailabilityFailure(
          originalAvailability: state.originalAvailability,
          updatedAvailability: state.updatedAvailability,
          failure: AppFailure(
            message: t.atLeastOneWorkingDayMustBeSelected,
            code: FailureCode.invalidData,
          ),
        ),
      );
      return false;
    }
    if (availability.slotDuration <= 0) {
      emit(
        SaveDoctorAvailabilityFailure(
          updatedAvailability: state.updatedAvailability,
          originalAvailability: state.originalAvailability,
          failure: AppFailure(
            message: t.slotDurationMustBeGreaterThanZero,
            code: FailureCode.invalidData,
          ),
        ),
      );
      return false;
    }
    return true;
  }
}
