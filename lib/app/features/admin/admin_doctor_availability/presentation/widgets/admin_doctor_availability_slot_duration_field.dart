import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_availability/presentation/controller/doctor_availability_bloc/doctor_availability_bloc.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminDoctorAvailabilitySlotDurationField extends StatefulWidget {
  const AdminDoctorAvailabilitySlotDurationField({super.key});

  @override
  State<AdminDoctorAvailabilitySlotDurationField> createState() =>
      _AdminDoctorAvailabilitySlotDurationFieldState();
}

class _AdminDoctorAvailabilitySlotDurationFieldState
    extends State<AdminDoctorAvailabilitySlotDurationField> {
  final MenuController _menuController = MenuController();

  final List<int> supportedDurations = [15, 30, 45, 60];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorAvailabilityBloc, DoctorAvailabilityState>(
      buildWhen: (prev, current) =>
          prev.updatedAvailability!.slotDuration !=
          current.updatedAvailability!.slotDuration,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              t.slotDuration.toUpperCase(),
              style: context.semiBold11TextSub,
            ),
            6.height,
            LayoutBuilder(
              builder: (context, constraints) {
                final menuWidth = constraints.maxWidth;

                return MenuAnchor(
                  crossAxisUnconstrained: false,
                  controller: _menuController,
                  alignmentOffset: const Offset(0, 4),
                  style: MenuStyle(
                    backgroundColor: const WidgetStatePropertyAll(
                      AppColors.white,
                    ),
                    surfaceTintColor: const WidgetStatePropertyAll(
                      Colors.transparent,
                    ),
                    elevation: const WidgetStatePropertyAll(4),
                    minimumSize: WidgetStatePropertyAll(Size(menuWidth, 0)),
                    maximumSize: WidgetStatePropertyAll(
                      Size(menuWidth, double.infinity),
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        side: BorderSide(
                          color: AppColors.textSub.withValues(alpha: 0.16),
                        ),
                      ),
                    ),
                    padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                    ),
                  ),
                  menuChildren: supportedDurations.map((duration) {
                    final isSelected =
                        duration == state.updatedAvailability!.slotDuration;

                    return MenuItemButton(
                      onPressed: () {
                        context.read<DoctorAvailabilityBloc>().add(
                          ChangeSlotDurationEvent(duration),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 8,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              t.minutesDuration(minutes: duration),
                              style: isSelected
                                  ? context.semiBold14Primary
                                  : context.medium14TextMain,
                            ),
                            if (isSelected)
                              const Icon(
                                Icons.check_rounded,
                                size: 18,
                                color: AppColors.primary,
                              ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                  builder: (context, controller, child) {
                    return InkWell(
                      onTap: () {
                        if (controller.isOpen) {
                          controller.close();
                        } else {
                          controller.open();
                        }
                      },
                      borderRadius: BorderRadius.circular(10.r),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 11,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.timer_outlined,
                              size: 20,
                              color: AppColors.successSoft,
                            ),
                            8.width,
                            Expanded(
                              child: Text(
                                t.minutesDuration(
                                  minutes:
                                      state.updatedAvailability!.slotDuration,
                                ),
                                style: context.medium14TextMain,
                              ),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 20,
                              color: AppColors.textSub,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
