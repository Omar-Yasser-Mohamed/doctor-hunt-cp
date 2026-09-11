import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

abstract final class AppToasts {
  static const Duration _defaultDuration = Duration(seconds: 4);

  static ToastificationItem showSuccess(
    BuildContext context,
    String message, {
    String? title,
    Duration? duration,
  }) {
    return _showToast(
      context: context,
      message: message,
      title: title,
      type: ToastificationType.success,
      primaryColor: AppColors.success,
      backgroundColor: AppColors.successLight,
      icon: Icons.check_circle_outline_rounded,
      duration: duration ?? _defaultDuration,
    );
  }

  static ToastificationItem showError(
    BuildContext context,
    String message, {
    String? title,
    Duration? duration,
  }) {
    return _showToast(
      context: context,
      message: message,
      title: title,
      type: ToastificationType.error,
      primaryColor: AppColors.danger,
      backgroundColor: AppColors.dangerLight,
      icon: Icons.error_outline_rounded,
      duration: duration ?? _defaultDuration,
    );
  }

  static ToastificationItem showWarning(
    BuildContext context,
    String message, {
    String? title,
    Duration? duration,
  }) {
    return _showToast(
      context: context,
      message: message,
      title: title,
      type: ToastificationType.warning,
      primaryColor: AppColors.warning,
      backgroundColor: AppColors.warningLight,
      icon: Icons.warning_amber_rounded,
      duration: duration ?? _defaultDuration,
    );
  }

  static ToastificationItem showInfo(
    BuildContext context,
    String message, {
    String? title,
    Duration? duration,
  }) {
    return _showToast(
      context: context,
      message: message,
      title: title,
      type: ToastificationType.info,
      primaryColor: AppColors.primary,
      backgroundColor: AppColors.primaryLight,
      icon: Icons.info_outline_rounded,
      duration: duration ?? _defaultDuration,
    );
  }

  static void dismiss(ToastificationItem item) {
    toastification.dismiss(item);
  }

  static void dismissAll() {
    toastification.dismissAll();
  }

  static ToastificationItem _showToast({
    required BuildContext context,
    required String message,
    String? title,
    required ToastificationType type,
    required Color primaryColor,
    required Color backgroundColor,
    required IconData icon,
    required Duration duration,
  }) {
    return toastification.show(
      context: context,
      type: type,
      style: ToastificationStyle.fillColored,

      // Position
      alignment: Alignment.topCenter,

      // Colors
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      foregroundColor: AppColors.textMain,

      // Size & Shape
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 13.h,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 8.h,
      ),
      borderRadius: BorderRadius.circular(16.r),

      // Border
      borderSide: BorderSide(
        color: AppColors.textBorders,
        width: 1.w,
      ),

      // Shadow
      boxShadow: const [
        BoxShadow(
          color: AppColors.boxShadow,
          blurRadius: 16,
          offset: Offset(0, 4),
        ),
      ],

      // No X button
      closeButton: const ToastCloseButton(
        showType: CloseButtonShowType.none,
      ),

      // Icon
      icon: Icon(
        icon,
        color: primaryColor,
        size: 22.sp,
      ),

      // Content
      title: title != null
          ? Text(
              title,
              style: context.semiBold14TextMain,
            )
          : null,
      description: Text(
        message,
        style: title != null
            ? context.regular12TextSub
            : context.medium14TextMain,
      ),

      // Progress
      autoCloseDuration: duration,
      showProgressBar: true,

      progressBarTheme: ProgressIndicatorThemeData(
        color: primaryColor,
        linearTrackColor: Colors.transparent,
        linearMinHeight: 2.h,
        borderRadius: BorderRadius.circular(8.r),
      ),

      // Behavior
      closeOnClick: true,
      dragToClose: true,
      pauseOnHover: true,
    );
  }
}