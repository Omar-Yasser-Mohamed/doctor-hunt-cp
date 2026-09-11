import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    this.child,
    this.onPressed,
    this.radius,
    this.height,
    this.width,
    this.isLoading = false,
    this.textStyle,
    this.backgroundColor,
    this.shape,
    this.indicatorColor,
  });
  final String text;
  final Widget? child;
  final void Function()? onPressed;
  final double? radius;
  final double? height;
  final double? width;
  final bool isLoading;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final OutlinedBorder? shape;
  final Color? indicatorColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.primary,
        disabledBackgroundColor: backgroundColor != null
            ? backgroundColor!.withValues(alpha: 0.3)
            : AppColors.primary.withValues(alpha: 0.3),
        disabledForegroundColor: Colors.white.withValues(alpha: 0.5),
        shape:
            shape ??
            RoundedRectangleBorder(
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
                  color: indicatorColor ?? Colors.white,
                  strokeWidth: 3,
                ),
              )
            : child ??
                  Text(
                    text,
                    style: textStyle ?? context.medium18White,
                  ),
      ),
    );
  }
}
