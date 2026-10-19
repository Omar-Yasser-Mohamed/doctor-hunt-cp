import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/app/features/common/appointments/presentation/widgets/mark_as_completed_dailog.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarkAsCompletedButton extends StatefulWidget {
  const MarkAsCompletedButton({
    super.key,
    required this.appointmentId,
    required this.isLoading,
    required this.onMarkCompleted,
    this.showIcon = false,
  });

  final String appointmentId;
  final bool isLoading;
  final VoidCallback onMarkCompleted;
  final bool showIcon;

  @override
  State<MarkAsCompletedButton> createState() => _MarkAsCompletedButtonState();
}

class _MarkAsCompletedButtonState extends State<MarkAsCompletedButton> {
  late final ValueNotifier<bool> _isLoadingNotifier;

  @override
  void initState() {
    super.initState();
    _isLoadingNotifier = ValueNotifier<bool>(widget.isLoading);
  }

  @override
  void didUpdateWidget(covariant MarkAsCompletedButton oldWidget) {
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
    return AppButton(
      height: 36.h,
      radius: 6.r,
      text: t.markAsCompleted,
      textStyle: context.medium11White,
      backgroundColor: AppColors.primary,
      padding: EdgeInsets.zero,
      onPressed: () {
        MarkAsCompletedDailog.show(
          context,
          appointmentId: widget.appointmentId,
          isLoading: _isLoadingNotifier,
          onConfirm: widget.onMarkCompleted,
        );
      },
      child: widget.showIcon
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_rounded,
                  size: 16,
                  color: AppColors.white,
                ),
                6.width,
                Text(
                  t.markAsCompleted,
                  style: context.medium11White,
                ),
              ],
            )
          : null,
    );
  }
}
