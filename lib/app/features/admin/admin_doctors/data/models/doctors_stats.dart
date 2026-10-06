import 'package:equatable/equatable.dart';

class DoctorsStats extends Equatable {
  final int totalDoctors;
  final int activeDoctors;

  const DoctorsStats({required this.totalDoctors, required this.activeDoctors});

  factory DoctorsStats.fromJson(Map<String, dynamic> json) {
    return DoctorsStats(
      totalDoctors: json['total_doctors'],
      activeDoctors: json['active_doctors'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_doctors': totalDoctors,
      'active_doctors': activeDoctors,
    };
  }

  DoctorsStats copyWith({
    int? totalDoctors,
    int? activeDoctors,
  }) {
    return DoctorsStats(
      totalDoctors: totalDoctors ?? this.totalDoctors,
      activeDoctors: activeDoctors ?? this.activeDoctors,
    );
  }

  @override
  List<Object?> get props => [totalDoctors, activeDoctors];
}