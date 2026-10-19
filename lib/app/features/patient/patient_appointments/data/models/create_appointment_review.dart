class CreateAppointmentReviewRequest {
  final String appointmentId;
  final int rating;
  final String? review;

  CreateAppointmentReviewRequest({
    required this.appointmentId,
    required this.rating,
    this.review,
  });

  Map<String, dynamic> toRpcParams() {
    return {
      'p_appointment_id': appointmentId,
      'p_rating': rating,
      'p_review': review == null || review!.trim().isEmpty ? null : review,
    };
  }
}
