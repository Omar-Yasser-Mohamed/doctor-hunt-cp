import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/string_extentions.dart';
import 'package:doctor_hunt/app/core/routing/app_routes.dart';
import 'package:doctor_hunt/app/core/shared/enums/appointment_status.dart';
import 'package:doctor_hunt/app/core/shared/models/appointment_model.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/features/admin/admin_appointments/presentation/controller/admin_appointments_bloc/admin_appointments_bloc.dart';
import 'package:doctor_hunt/app/features/common/appointments/presentation/widgets/appointment_status_badge.dart';
import 'package:doctor_hunt/app/features/common/appointments/presentation/widgets/appointment_view_details_button.dart';
import 'package:doctor_hunt/app/features/common/appointments/presentation/widgets/cancel_appointment_button.dart';
import 'package:doctor_hunt/app/features/common/appointments/presentation/widgets/mark_as_completed_button.dart';
import 'package:doctor_hunt/app/core/widgets/custom_network_image.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

part 'admin_appointment_card_actions.dart';

class AdminAppointmentCard extends StatelessWidget {
  const AdminAppointmentCard({super.key, required this.appointment});
  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppointmentDetailsRoute($extra: appointment.id).push(context);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            _PatientAndDoctorInfo(appointment: appointment),

            14.height,

            const Divider(
              height: 1,
              thickness: 1,
              color: AppColors.grayLight,
            ),

            14.height,

            _PatientAppointmentCardDetails(appointment: appointment),

            14.height,

            _AdminAppointmentCardActions(appointment: appointment),
          ],
        ),
      ),
    );
  }
}

class _PatientAndDoctorInfo extends StatelessWidget {
  const _PatientAndDoctorInfo({required this.appointment});
  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (appointment.patient?.image != null)
          CustomNetworkImage(
            imageUrl: appointment.patient?.image ?? "",
            height: 48.w,
            width: 48.w,
            radius: 12.r,
          )
        else
          Container(
            height: 48.w,
            width: 48.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              appointment.patient?.name.toAvatar ?? "",
              style: context.bold16White,
            ),
          ),

        10.width,

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appointment.patient?.name ?? "",
                overflow: TextOverflow.ellipsis,
                style: context.semiBold14TextMain.copyWith(
                  letterSpacing: -0.2,
                ),
              ),

              1.height,

              Text(
                appointment.doctor?.name ?? "",
                overflow: TextOverflow.ellipsis,
                style: context.medium12.copyWith(
                  color: AppColors.textThird,
                ),
              ),

              Text(
                appointment.doctor?.specialty.title ?? "",
                overflow: TextOverflow.ellipsis,
                style: context.light11TextSub,
              ),
            ],
          ),
        ),

        10.width,

        AppointmentStatusBadge(status: appointment.status),
      ],
    );
  }
}

class _PatientAppointmentCardDetails extends StatelessWidget {
  const _PatientAppointmentCardDetails({required this.appointment});
  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    final locale = LocaleSettings.currentLocale.languageCode;
    return Row(
      children: [
        Expanded(
          child: _AppointmentDetailsTile(
            icon: Icons.calendar_month_outlined,
            title: t.date,
            value: DateFormat(
              "dd MMM yyyy",
              locale,
            ).format(appointment.appointmentAt),
          ),
        ),

        6.width,

        Expanded(
          child: _AppointmentDetailsTile(
            icon: Icons.access_time_rounded,
            title: t.time,
            value: DateFormat.jm(locale).format(appointment.appointmentAt),
          ),
        ),

        6.width,

        Expanded(
          child: _AppointmentDetailsTile(
            icon: Icons.attach_money_rounded,
            title: t.fee,
            value: "\$${appointment.doctor?.fees}",
          ),
        ),
      ],
    );
  }
}

class _AppointmentDetailsTile extends StatelessWidget {
  const _AppointmentDetailsTile({
    required this.icon,
    required this.title,
    required this.value,
  });
  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: AppColors.activeLight,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: 19,
            weight: 1.7,
            color: AppColors.successSoft,
          ),
        ),

        6.width,

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.regular11.copyWith(
                  fontSize: 9.sp,
                  color: AppColors.unselectedIcon,
                ),
              ),

              Text(
                value,
                style: context.semiBold11TextMain.copyWith(letterSpacing: -0.1),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
