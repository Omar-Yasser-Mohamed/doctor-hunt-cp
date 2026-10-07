import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/utils/app_toasts.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_availability/presentation/controller/doctor_availability_bloc/doctor_availability_bloc.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminDoctorAvailabilitySaveButton extends StatelessWidget {
  const AdminDoctorAvailabilitySaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorAvailabilityBloc, DoctorAvailabilityState>(
      listener: (context, state) {
        if (state is SaveDoctorAvailabilitySuccess) {
          AppToasts.showSuccess(
            context,
            t.availabilityUpdatedSuccessfully,
          );
        } else if (state is SaveDoctorAvailabilityFailure) {
          AppToasts.showError(
            context,
            state.failure.message,
          );
        }
      },
      builder: (context, state) {
        return AppButton(
          isLoading: state is SaveDoctorAvailabilityLoading,
          height: 52.h,
          radius: 12.r,
          text: t.saveAvailability,
          isDisabled: !state.hasChanges,
          onPressed: () {
            context.read<DoctorAvailabilityBloc>().add(
              const SaveDoctorAvailabilityEvent(),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_rounded,
                size: 22,
                color: AppColors.white,
              ),
              8.width,
              Text(
                t.saveAvailability,
                style: context.semiBold16White,
              ),
            ],
          ),
        );
      },
    );
  }
}
