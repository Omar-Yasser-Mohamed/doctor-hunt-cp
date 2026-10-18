part of 'patient_appointment_card.dart';

class _PatientAppointmentRatingSection extends StatelessWidget {
  const _PatientAppointmentRatingSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.activeLight,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              t.tapToRateYourVisit,
              style: context.regular11TextSub,
            ),
          ),

          5.width,

          const DynamicRatingStars(rating: 0),
        ],
      ),
    );
  }
}
