import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

extension SnakeBarExtention on BuildContext {
  // Suucess snake bar
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSuccessSnakbar({
    required String message,
  }) => ScaffoldMessenger.of(this).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.success,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      content: Row(
        children: [
          const Icon(
            Icons.check_circle_outline_rounded,
            color: Colors.white,
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Text(
              message,
              style: semiBold14White,
            ),
          ),
        ],
      ),
    ),
  );

  // Error snake bar
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showErrorSnakbar({
    required String message,
  }) => ScaffoldMessenger.of(this).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.danger,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      content: Row(
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.white,
          ),
          const SizedBox(width: 14),

          Expanded(
            child: Text(
              message,
              style: semiBold14White,
            ),
          ),
        ],
      ),
    ),
  );
}
