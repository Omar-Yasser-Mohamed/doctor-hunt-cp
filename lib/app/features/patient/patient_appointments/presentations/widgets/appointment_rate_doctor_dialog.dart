import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/shared/models/appointment_model.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/utils/app_icons.dart';
import 'package:doctor_hunt/app/core/utils/app_toasts.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/app/core/widgets/app_text_field.dart';
import 'package:doctor_hunt/app/features/patient/patient_appointments/presentations/controller/patient_appointments_bloc/patient_appointments_bloc.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AppointmentRateDoctorDialog extends StatefulWidget {
  const AppointmentRateDoctorDialog({super.key, required this.appointment});
  final AppointmentModel appointment;

  static Future<void> show({
    required BuildContext context,
    required AppointmentModel appointment,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => BlocProvider.value(
        value: context.read<PatientAppointmentsBloc>(),
        child: AppointmentRateDoctorDialog(appointment: appointment),
      ),
    );
  }

  @override
  State<AppointmentRateDoctorDialog> createState() =>
      _AppointmentRateDoctorDialogState();
}

class _AppointmentRateDoctorDialogState
    extends State<AppointmentRateDoctorDialog> {
  final TextEditingController _reviewController = TextEditingController();
  int _selectedRating = 0;

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientAppointmentsBloc, PatientAppointmentsState>(
      listener: (context, state) {
        if (state is SubmitAppointmentReviewSuccess) {
          AppToasts.showSuccess(context, t.reviewSubmittedSuccess);
          context.pop();
        } else if (state is PatientAppointmentsActionFailure) {
          AppToasts.showError(context, state.failure.message);
          context.pop();
        }
      },
      builder: (context, state) {
        final isLoading = state is PatientAppointmentsActionLoading;
        return Dialog(
          backgroundColor: AppColors.white,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
          clipBehavior: Clip.antiAlias,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        t.rateYourVisit,
                        style: context.semiBold18Black,
                      ),
                    ),
                    IconButton(
                      onPressed: isLoading ? null : () => context.pop(),
                      icon: const Icon(
                        Icons.close_rounded,
                        color: AppColors.secondary,
                        size: 22,
                      ),
                      splashRadius: 20,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),

                16.height,

                Center(
                  child: SvgPicture.asset(
                    AppIcons.medical,
                    width: 44.r,
                    height: 44.r,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),

                12.height,

                Text(
                  t.rateDoctorTitle(
                    name: widget.appointment.doctor?.name ?? "",
                  ),
                  textAlign: TextAlign.center,
                  style: context.semiBold16TextMain,
                ),

                8.height,

                Text(
                  t.howWasYourExperience,
                  textAlign: TextAlign.center,
                  style: context.regular14TextSub,
                ),

                12.height,

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    final starIndex = index + 1;
                    final isSelected = starIndex <= _selectedRating;

                    return GestureDetector(
                      onTap: isLoading ? null : () {
                        setState(() {
                          _selectedRating =
                              (_selectedRating == 1 && starIndex == 1)
                              ? 0
                              : starIndex;
                        });
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Icon(
                        isSelected
                            ? Icons.star_rounded
                            : Icons.star_outline_rounded,
                        color: isSelected
                            ? AppColors.yellow
                            : AppColors.unselectedIcon.withValues(alpha: 0.4),
                        size: 36,
                      ),
                    );
                  }),
                ),

                12.height,

                Padding(
                  padding: EdgeInsetsDirectional.only(start: 4.w),
                  child: Text(
                    t.writeAReviewOptional,
                    style: context.medium14TextMain,
                  ),
                ),

                8.height,

                AppTextField(
                  controller: _reviewController,
                  minLines: 3,
                  maxLines: 4,
                  hintText: t.shareYourExperienceHint,
                  hintStyle: context.regular14TextPlaceholder,
                  textStyle: context.regular14TextMain,
                  readOnly: isLoading,
                  contentPadding: const EdgeInsets.all(14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: AppColors.textSub.withValues(alpha: 0.16),
                    ),
                  ),
                ),

                20.height,

                AppButton(
                  text: t.submitReview,
                  radius: 8.r,
                  height: 44.h,
                  textStyle: context.medium14White,
                  backgroundColor: AppColors.primary,
                  isDisabled: _selectedRating <= 0 || isLoading,
                  isLoading: isLoading,
                  onPressed: () {
                    context.read<PatientAppointmentsBloc>().add(
                      SubmitAppointmentReviewEvent(
                        appointmentId: widget.appointment.id,
                        rating: _selectedRating,
                        review: _reviewController.text.trim(),
                      ),
                    );
                  },
                ),

                4.height,
              ],
            ),
          ),
        );
      },
    );
  }
}
