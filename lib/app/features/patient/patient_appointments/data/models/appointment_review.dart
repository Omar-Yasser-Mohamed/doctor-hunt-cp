import 'package:equatable/equatable.dart';

class AppointmentReview extends Equatable {
  final String id;
  final String appointmentId;
  final int rating;
  final String? review;
  final DateTime createdAt;

  const AppointmentReview({
    required this.id,
    required this.appointmentId,
    required this.rating,
    required this.review,
    required this.createdAt,
  });

  AppointmentReview copyWith({
    String? id,
    String? appointmentId,
    int? rating,
    String? review,
    DateTime? createdAt,
  }) {
    return AppointmentReview(
      id: id ?? this.id,
      appointmentId: appointmentId ?? this.appointmentId,
      rating: rating ?? this.rating,
      review: review ?? this.review,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory AppointmentReview.fromJson(Map<String, dynamic> json) =>
      AppointmentReview(
        id: json['id'] as String,
        appointmentId: json['appointment_id'] as String,
        rating: json['rating'] as int,
        review: json['review'] as String?,
        createdAt: DateTime.parse(json['created_at'] as String),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'appointment_id': appointmentId,
    'rating': rating,
    'review': review,
    'created_at': createdAt.toIso8601String(),
  };

  @override
  List<Object?> get props => [
    id,
    appointmentId,
    rating,
    review,
    createdAt,
  ];
}
