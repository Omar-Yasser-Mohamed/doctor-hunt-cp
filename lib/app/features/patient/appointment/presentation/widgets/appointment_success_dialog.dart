import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AppointmentSuccessDialog extends StatelessWidget {
  const AppointmentSuccessDialog({
    super.key,
  });

  static Future<T?> show<T>(
    BuildContext context,
  ) {
    return showDialog<T>(
      context: context,
      barrierDismissible: true,
      builder: (context) => const AppointmentSuccessDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 156.r,
              height: 156.r,
              decoration: const BoxDecoration(
                color: AppColors.primaryLight,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.thumb_up_alt_rounded,
                color: AppColors.primary,
                size: 70.r,
              ),
            ),

            12.height,

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  Text(
                    t.thankYou,
                    style: context.bold36TextMain.copyWith(
                      letterSpacing: -0.3,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  4.height,

                  Text(
                    t.appointmentSuccessful,
                    style: context.regular20TextSub.copyWith(
                      letterSpacing: -0.3,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            28.height,

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                t.appointmentSuccessfulDescription(
                  doctorName: "Omar Yasser",
                  date: "February 21",
                  time: "02:00 PM",
                ),
                style: context.regular14TextSub,
                textAlign: TextAlign.center,
              ),
            ),

            28.height,

            AppButton(
              text: t.done,
              radius: 6.r,
              onPressed: () => context.pop(),
            ),

            18.height,

            GestureDetector(
              onTap: () => context.pop(),
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                child: Text(
                  t.editYourAppointment,
                  style: context.regular14TextSub,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
