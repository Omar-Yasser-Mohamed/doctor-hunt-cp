part of 'patient_appointment_card.dart';

class _PatientAppointmentRatingSection extends StatelessWidget {
  const _PatientAppointmentRatingSection({required this.appointment});
  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (appointment.review == null) {
          AppointmentRateDoctorDialog.show(
            context: context,
            appointment: appointment,
          );
        } else {
          ShowReviewDailog.show(
            context,
            review: appointment.review!,
          );
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: AppColors.activeLight,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                appointment.review == null
                    ? t.tapToRateYourVisit
                    : appointment.review?.review != null
                    ? '"${appointment.review!.review}"'
                    : t.thankYouForRating,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: context.regular11TextSub,
              ),
            ),

            6.width,

            DynamicRatingStars(
              rating: appointment.review?.rating.toDouble() ?? 0,
            ),
          ],
        ),
      ),
    );
  }
}
