part of 'admin_appointment_card.dart';

class AdminAppointmentCardReviewSection extends StatelessWidget {
  const AdminAppointmentCardReviewSection({
    super.key,
    required this.appointment,
  });
  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    final isReviewed = appointment.review != null;
    return GestureDetector(
      onTap: isReviewed
          ? () {
              ShowReviewDailog.show(
                context,
                review: appointment.review!,
              );
            }
          : null,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          color: AppColors.reviewLight,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: isReviewed
            ? Row(
                children: [
                  const Icon(Icons.star, color: AppColors.textThird, size: 14),
                  Expanded(
                    child: Text(
                      ' ${appointment.review?.rating}  ·  ${appointment.review?.review != null ? "${appointment.review?.review}" : ""}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: context.regular11.copyWith(
                        color: AppColors.textThird,
                      ),
                    ),
                  ),
                ],
              )
            : Text(
                t.patientNotReviewedYet,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: context.regular11.copyWith(
                  color: AppColors.textThird,
                ),
              ),
      ),
    );
  }
}
