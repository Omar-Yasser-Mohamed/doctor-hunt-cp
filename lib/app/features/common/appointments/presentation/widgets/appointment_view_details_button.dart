import 'package:doctor_hunt/app/core/routing/app_routes.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/app_outline_button.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentViewDetailsButton extends StatelessWidget {
  const AppointmentViewDetailsButton({super.key, required this.appointmentId});

  final String appointmentId;

  @override
  Widget build(BuildContext context) {
    return AppOutlineButton(
      height: 36.h,
      radius: 6.r,
      textStyle: context.medium11Primary,
      text: t.viewDetails,
      onPressed: () {
        AppointmentDetailsRoute($extra: appointmentId).push(context);
      },
    );
  }
}
