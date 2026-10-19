import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/routing/app_routes.dart';
import 'package:doctor_hunt/app/core/shared/enums/appointment_status.dart';
import 'package:doctor_hunt/app/core/shared/models/appointment_model.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/app/features/common/appointments/presentation/widgets/appointment_status_badge.dart';
import 'package:doctor_hunt/app/features/common/appointments/presentation/widgets/appointment_view_details_button.dart';
import 'package:doctor_hunt/app/features/common/appointments/presentation/widgets/cancel_appointment_button.dart';
import 'package:doctor_hunt/app/core/widgets/custom_network_image.dart';
import 'package:doctor_hunt/app/core/widgets/dynamic_rating_stars.dart';
import 'package:doctor_hunt/app/features/patient/patient_appointments/presentations/controller/patient_appointments_bloc/patient_appointments_bloc.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

part 'patient_appointment_card_actions.dart';
part 'patient_appointment_rating_section.dart';

class PatientAppointmentCard extends StatelessWidget {
  const PatientAppointmentCard({super.key, required this.appointment});
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
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 20,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            _PatientAppointmentCardDoctorInfo(appointment: appointment),
      
            10.height,
      
            const Divider(
              height: 1,
              thickness: 1,
              color: AppColors.grayLight,
            ),
      
            10.height,
      
            _PatientAppointmentCardDetails(appointment: appointment),
      
            10.height,
      
            if (appointment.status == AppointmentStatus.completed) ...[
              const _PatientAppointmentRatingSection(),
              10.height,
            ],
      
            _PatientAppointmentCardActions(appointment: appointment),
          ],
        ),
      ),
    );
  }
}

class _PatientAppointmentCardDoctorInfo extends StatelessWidget {
  const _PatientAppointmentCardDoctorInfo({required this.appointment});
  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomNetworkImage(
          imageUrl: appointment.doctor?.photo ?? "",
          height: 66.w,
          width: 66.w,
          radius: 8.r,
        ),

        10.width,

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appointment.doctor?.name ?? "",
                overflow: TextOverflow.ellipsis,
                style: context.medium16TextMain.copyWith(
                  letterSpacing: -0.3,
                ),
              ),

              2.height,

              Text(
                "${t.Specialist} ${appointment.doctor?.specialty.title ?? ""}",
                overflow: TextOverflow.ellipsis,
                style: context.light12TextSub.copyWith(
                  letterSpacing: -0.2,
                ),
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
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _AppointmentDetailsTile(
                icon: Icons.calendar_month_outlined,
                title: t.appointmentDate,
                value: DateFormat(
                  "dd MMM yyyy",
                  locale,
                ).format(appointment.appointmentAt),
              ),
            ),

            8.width,

            Expanded(
              child: _AppointmentDetailsTile(
                icon: Icons.access_time_rounded,
                title: t.appointmentTime,
                value: DateFormat.jm(locale).format(appointment.appointmentAt),
              ),
            ),
          ],
        ),
        8.height,
        _AppointmentDetailsTile(
          icon: Icons.attach_money_rounded,
          title: t.consultationFee,
          value: "\$${appointment.doctor?.fees}",
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
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(
            icon,
            size: 22,
            color: AppColors.primary,
          ),
        ),

        7.width,

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.regular11.copyWith(
                fontSize: 10.sp,
                color: AppColors.unselectedIcon,
              ),
            ),

            Text(
              value,
              style: context.medium11TextMain,
            ),
          ],
        ),
      ],
    );
  }
}
