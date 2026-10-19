import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/app_outline_button.dart';
import 'package:doctor_hunt/app/features/common/appointments/presentation/widgets/cancel_appointment_dailog.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CancelAppointmentButton extends StatefulWidget {
  const CancelAppointmentButton({
    super.key,
    required this.appointmentId,
    required this.onCancel,
    required this.isLoading,
  });
  final String appointmentId;
  final bool isLoading;
  final VoidCallback onCancel;

  @override
  State<CancelAppointmentButton> createState() =>
      _CancelAppointmentButtonState();
}

class _CancelAppointmentButtonState extends State<CancelAppointmentButton> {
  late final ValueNotifier<bool> _isLoadingNotifier;

  @override
  void initState() {
    super.initState();
    _isLoadingNotifier = ValueNotifier<bool>(widget.isLoading);
  }

  @override
  void didUpdateWidget(covariant CancelAppointmentButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isLoading != widget.isLoading) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _isLoadingNotifier.value = widget.isLoading;
        }
      });
    }
  }

  @override
  void dispose() {
    _isLoadingNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppOutlineButton(
      text: t.cancelAppointment,
      height: 36.h,
      radius: 6.r,
      backgroundColor: AppColors.inactiveLight,
      borderColor: AppColors.inactive,
      textStyle: context.medium11.copyWith(color: AppColors.inactive),
      onPressed: () {
        CancelAppointmentDailog.show(
          context,
          appointmentId: widget.appointmentId,
          isLoading: _isLoadingNotifier,
          onCancel: widget.onCancel,
        );
      },
    );
  }
}

