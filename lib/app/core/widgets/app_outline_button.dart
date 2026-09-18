import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppOutlineButton extends StatelessWidget {
  const AppOutlineButton({
    super.key,
    required this.text,
    this.child,
    this.onPressed,
    this.radius,
    this.height,
    this.width,
    this.isLoading = false,
    this.textStyle,
    this.borderColor,
    this.backgroundColor,
    this.loadingIndicatorColor,
  });

  final String text;
  final Widget? child;
  final void Function()? onPressed;
  final double? radius;
  final double? height;
  final double? width;
  final bool isLoading;
  final TextStyle? textStyle;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? loadingIndicatorColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: AppColors.primary,
        side: BorderSide(
          color: borderColor ?? AppColors.primary.withValues(alpha: .5),
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 12.r),
        ),
        elevation: 0,
        minimumSize: Size(width ?? context.screenWidth, height ?? 54.h),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        child: isLoading
            ? SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: loadingIndicatorColor?? AppColors.primary,
                  strokeWidth: 3,
                ),
              )
            : child ??
                Text(
                  text,
                  style: textStyle ?? context.medium18Primary,
                ),
      ),
    );
  }
}