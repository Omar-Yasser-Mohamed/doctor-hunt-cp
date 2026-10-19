import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/dynamic_rating_stars.dart';
import 'package:doctor_hunt/app/features/patient/patient_appointments/data/models/appointment_review.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ShowReviewDailog extends StatelessWidget {
  const ShowReviewDailog({super.key, required this.review});
  final AppointmentReview review;

  static Future<void> show(
    BuildContext context, {
    required AppointmentReview review,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (_) => ShowReviewDailog(review: review),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasReviewText =
        review.review != null && review.review!.trim().isNotEmpty;

    return Dialog(
      backgroundColor: AppColors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    t.appointmentReview,
                    style: context.semiBold18Black,
                  ),
                ),
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(
                    Icons.close_rounded,
                    color: AppColors.secondary,
                    size: 22,
                  ),
                  splashRadius: 20,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),

            16.height,

            Center(
              child: DynamicRatingStars(
                rating: review.rating.toDouble(),
                size: 32,
              ),
            ),

            if (hasReviewText) ...[
              16.height,
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.reviewLight,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: AppColors.warning.withValues(alpha: 0.25),
                  ),
                ),
                child: Text(
                  review.review!.trim(),
                  style: context.regular14TextMain,
                  textAlign: TextAlign.center,
                ),
              ),
            ],

            8.height,
          ],
        ),
      ),
    );
  }
}