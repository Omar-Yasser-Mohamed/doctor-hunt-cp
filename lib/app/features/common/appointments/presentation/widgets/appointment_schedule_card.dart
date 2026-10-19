import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/shared/models/appointment_model.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/features/common/appointments/presentation/widgets/appointment_status_badge.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AppointmentScheduleCard extends StatelessWidget {
  const AppointmentScheduleCard({super.key, required this.appointment});

  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    final locale = LocaleSettings.currentLocale.languageCode;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              t.appointment,
              style: context.bold14TextMain,
            ),
            AppointmentStatusBadge(status: appointment.status),
          ],
        ),
        8.height,
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _AppointmentDetailTile(
                      icon: Icons.calendar_month_outlined,
                      label: t.date,
                      value: DateFormat(
                        'dd MMM yyyy',
                        locale,
                      ).format(appointment.appointmentAt),
                    ),
                  ),
                  10.width,
                  Expanded(
                    child: _AppointmentDetailTile(
                      icon: Icons.access_time_rounded,
                      label: t.time,
                      value: DateFormat.jm(
                        locale,
                      ).format(appointment.appointmentAt),
                    ),
                  ),
                ],
              ),
              10.height,
              _AppointmentDetailTile(
                icon: Icons.attach_money_rounded,
                label: t.consultationFee,
                value: "\$${appointment.doctor?.fees ?? "0"}",
              ),
              10.height,
              _AppointmentDetailTile(
                icon: Icons.location_on_outlined,
                label: t.clinicLocation,
                value: appointment.doctor?.admin?.address ?? "",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AppointmentDetailTile extends StatelessWidget {
  const _AppointmentDetailTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.adminBackground,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.activeLight,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              icon,
              size: 24,
              color: AppColors.primary,
            ),
          ),
          8.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label.toUpperCase(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.regular11.copyWith(
                    fontSize: 9.sp,
                    letterSpacing: 0.35,
                    color: AppColors.unselectedIcon,
                  ),
                ),
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.semiBold12TextMain,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
