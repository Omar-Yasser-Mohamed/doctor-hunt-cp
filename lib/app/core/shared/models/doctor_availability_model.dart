import 'package:equatable/equatable.dart';

class DoctorAvailabilityModel extends Equatable {
  final String id;
  final String doctorId;
  final List<String> workingDays;
  final String startTime;
  final String endTime;
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

  factory DoctorAvailabilityModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return DoctorAvailabilityModel(
      id: json['id'] as String,
      doctorId: json['doctor_id'] as String,
      workingDays: List<String>.from(
        json['working_days'] as List,
      ),
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      slotDuration: json['slot_duration'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'doctor_id': doctorId,
    'working_days': workingDays,
    'start_time': startTime,
    'end_time': endTime,
    'slot_duration': slotDuration,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
  };

  DoctorAvailabilityModel copyWith({
    String? id,
    String? doctorId,
    List<String>? workingDays,
    String? startTime,
    String? endTime,
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
