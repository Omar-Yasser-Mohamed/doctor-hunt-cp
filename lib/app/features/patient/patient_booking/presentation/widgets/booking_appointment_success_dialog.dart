import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/routing/app_routes.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/app/features/patient/patient_booking/data/models/appointment_slot.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class BookingAppointmentSuccessDialog extends StatelessWidget {
  const BookingAppointmentSuccessDialog({
    super.key,
    required this.doctorName,
    required this.appointmentSlot,
  });
  final String doctorName;
  final AppointmentSlot appointmentSlot;

  static Future<T?> show<T>(
    BuildContext context, {
    required String doctorName,
    required AppointmentSlot appointmentSlot,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: false,
      builder: (context) => BookingAppointmentSuccessDialog(
        doctorName: doctorName,
        appointmentSlot: appointmentSlot,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final locale = LocaleSettings.currentLocale.languageCode;
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
                  doctorName: doctorName,
                  date: DateFormat(
                    "MMMM dd",
                    locale,
                  ).format(appointmentSlot.date),
                  time: DateFormat.jm(locale).format(appointmentSlot.date),
                ),
                style: context.regular14TextSub,
                textAlign: TextAlign.center,
              ),
            ),

            28.height,

            AppButton(
              text: t.done,
              radius: 6.r,
              onPressed: () => const PatientHomeRoute().go(context),
            ),

            18.height,
          ],
        ),
      ),
    );
  }
}
