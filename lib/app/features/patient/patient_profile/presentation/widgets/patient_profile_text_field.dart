import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientProfileTextField extends StatelessWidget {
  const PatientProfileTextField({
    super.key,
    required this.label,
    this.controller,
    this.enabled = true,
    this.readOnly = false,
    this.keyboardType,
    this.validator,
    this.onTap,
    this.suffixIcon,
  });

  final String label;
  final TextEditingController? controller;
  final bool enabled;
  final bool readOnly;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: context.medium12Primary.copyWith(fontSize: 10.sp),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    enabled: enabled,
                    readOnly: readOnly,
                    keyboardType: keyboardType,
                    validator: validator,
                    onTap: onTap,
                    onTapOutside: (_) => FocusScope.of(context).unfocus(),
                    style: enabled
                        ? context.regular16TextSub
                        : context.regular16TextSub.copyWith(
                            color: AppColors.textPlaceholder,
                          ),
                    cursorColor: AppColors.primary,
                    decoration: const InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ?suffixIcon,
        ],
      ),
    );
  }
}
