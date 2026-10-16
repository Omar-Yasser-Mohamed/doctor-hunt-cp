import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/features/patient/patient_booking/presentation/widgets/appointment_available_slots_bloc_builder.dart';
import 'package:doctor_hunt/app/features/patient/patient_booking/presentation/widgets/appointment_date_selection.dart';
import 'package:doctor_hunt/app/features/patient/patient_booking/presentation/widgets/booking_appointment_confirmation_button.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientBookingAppointmentScreenBody extends StatelessWidget {
  const PatientBookingAppointmentScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: AppointmentDateSelection()),

        SliverToBoxAdapter(child: 20.height),

        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 24.w),
            child: Text(t.availableTimes, style: context.semiBold16),
          ),
        ),

        SliverToBoxAdapter(child: 16.height),

        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          sliver: const AppointmentAvailableSlotsBlocBuilder(),
        ),

        const SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BookingAppointmentConfirmationButton(),
            ],
          ),
        ),
      ],
    );
  }
}
