import 'package:doctor_hunt/app/core/utils/time_utils.dart';
import 'package:doctor_hunt/app/core/shared/enums/week_day.dart';
import 'package:flutter/material.dart';

class UpdateDoctorAvailabilityRequest {
  final List<WeekDay> workingDays;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final int slotDuration;

  UpdateDoctorAvailabilityRequest({
    required this.workingDays,
    required this.startTime,
    required this.endTime,
    required this.slotDuration,
  });

  Map<String, dynamic> toJson() => {
    'working_days': WeekDay.listValues(workingDays),
    'start_time': TimeUtils.toSupabaseFormat(startTime),
    'end_time': TimeUtils.toSupabaseFormat(endTime),
    'slot_duration': slotDuration,
  };
}