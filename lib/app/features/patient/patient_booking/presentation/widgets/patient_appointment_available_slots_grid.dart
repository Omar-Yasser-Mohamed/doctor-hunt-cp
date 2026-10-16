import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/features/patient/patient_booking/data/models/appointment_slot.dart';
import 'package:doctor_hunt/app/features/patient/patient_booking/presentation/controller/patient_booking_bloc/patient_booking_bloc.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class PatientAppointmentAvailableSlotsGrid extends StatelessWidget {
  const PatientAppointmentAvailableSlotsGrid({
    super.key,
    required this.appointmentSlots,
  });
  final List<AppointmentSlot> appointmentSlots;

  int _buildCrossAxisCount(double width) {
    if (width > 1200) {
      return 7;
    } else if (width > 900) {
      return 6;
    } else if (width > 600) {
      return 5;
    } else {
      return 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _buildCrossAxisCount(context.screenWidth),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 76.w / 40.h,
      ),
      itemCount: appointmentSlots.length,
      itemBuilder: (context, index) {
        return SlotChip(
          key: ValueKey(appointmentSlots[index].date),
          slot: appointmentSlots[index],
        );
      },
    );
  }
}

class SlotChip extends StatelessWidget {
  const SlotChip({
    super.key,
    required this.slot,
  });
  final AppointmentSlot slot;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientBookingBloc, PatientBookingState>(
      builder: (context, state) {
        final bloc = context.read<PatientBookingBloc>();
        final isSelected = bloc.selectedSlot == slot;

        final locale = LocaleSettings.currentLocale.languageCode;

        return GestureDetector(
          onTap: () {
            if (isSelected) return;
            bloc.add(SelectAppointmentSlot(slot: slot));
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primary
                  : AppColors.primary.withValues(alpha: .08),
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Center(
              child: Text(
                DateFormat.jm(locale).format(slot.date),
                style: context.medium12.copyWith(
                  color: isSelected ? AppColors.white : AppColors.primary,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
