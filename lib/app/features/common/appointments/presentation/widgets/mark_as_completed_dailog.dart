import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MarkAsCompletedDailog extends StatelessWidget {
  const MarkAsCompletedDailog({
    super.key,
    required this.appointmentId,
    required this.isLoading,
    required this.onConfirm,
  });
  final String appointmentId;
  final ValueListenable<bool> isLoading;
  final VoidCallback onConfirm;

  static Future<void> show(
    BuildContext context, {
    required String appointmentId,
    required ValueListenable<bool> isLoading,
    required VoidCallback onConfirm,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => MarkAsCompletedDailog(
        appointmentId: appointmentId,
        isLoading: isLoading,
        onConfirm: onConfirm,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isLoading,
      builder: (context, loading, _) {
        return PopScope(
          canPop: !loading,
          child: Dialog(
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  8.height,

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          t.markAppointmentAsCompletedTitle,
                          style: context.semiBold20Black,
                        ),
                        12.height,
                        Text(
                          t.markAppointmentAsCompletedDescription,
                          style: context.regular14TextSub,
                        ),
                      ],
                    ),
                  ),

                  24.height,

                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: loading ? null : () => context.pop(),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(context.screenWidth, 40.h),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            t.cancel,
                            style: context.medium14Black,
                          ),
                        ),
                      ),
                      10.width,
                      Expanded(
                        child: AppButton(
                          text: t.confirm,
                          isLoading: loading,
                          isDisabled: loading,
                          padding: EdgeInsets.zero,
                          backgroundColor: AppColors.primary,
                          textStyle: context.medium14White,
                          height: 40.h,
                          onPressed: onConfirm,
                        ),
                      ),
                    ],
                  ),

                  8.height,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
