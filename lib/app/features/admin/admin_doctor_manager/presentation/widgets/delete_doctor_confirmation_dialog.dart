import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DeleteDoctorConfirmationDialog extends StatelessWidget {
  const DeleteDoctorConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      title: Text(
        t.deleteDoctorConfirmationTitle,
        style: context.bold18TextMain,
      ),
      content: Text(
        t.deleteDoctorConfirmationMessage,
        style: context.regular14TextSub,
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(false),
          child: Text(
            t.cancel,
            style: context.medium14TextSub,
          ),
        ),
        TextButton(
          onPressed: () => context.pop(true),
          child: Text(
            t.delete,
            style: context.medium14TextMain.copyWith(
              color: AppColors.danger,
            ),
          ),
        ),
      ],
    );
  }
}
