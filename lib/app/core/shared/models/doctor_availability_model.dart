import 'package:doctor_hunt/app/core/utils/time_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:doctor_hunt/app/core/shared/enums/week_day.dart';
import 'package:flutter/material.dart';

class DoctorAvailabilityModel extends Equatable {
  final String id;
  final String doctorId;
  final List<WeekDay> workingDays;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final int slotDuration;
  final DateTime createdAt;
  final DateTime updatedAt;

  const DoctorAvailabilityModel({
    required this.id,
    required this.doctorId,
    required this.workingDays,
    required this.startTime,
    required this.endTime,
    required this.slotDuration,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DoctorAvailabilityModel.fromJson(Map<String, dynamic> json) {
    return DoctorAvailabilityModel(
      id: json['id'] as String,
      doctorId: json['doctor_id'] as String,
      workingDays: WeekDay.listFromString(
        (json['working_days'] as List).map((e) => e.toString()).toList(),
      ),
      startTime: TimeUtils.fromSupabaseFormat(json['start_time'] as String),
      endTime: TimeUtils.fromSupabaseFormat(json['end_time'] as String),
      slotDuration: json['slot_duration'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  DoctorAvailabilityModel copyWith({
    String? id,
    String? doctorId,
    List<WeekDay>? workingDays,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    int? slotDuration,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return DoctorAvailabilityModel(
      id: id ?? this.id,
      doctorId: doctorId ?? this.doctorId,
      workingDays: workingDays ?? this.workingDays,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      slotDuration: slotDuration ?? this.slotDuration,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
    id,
    doctorId,
    workingDays,
    startTime,
    endTime,
    slotDuration,
    createdAt,
    updatedAt,
  ];
}
