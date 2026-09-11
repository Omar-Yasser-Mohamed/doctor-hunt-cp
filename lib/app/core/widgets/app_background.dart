import 'dart:ui';

import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const ColoredBox(
          color: AppColors.white,
        ),

        Positioned(
          top: -33.h,
          left: context.isArabic ? null : -99.w,
          right: context.isArabic ? -99.w : null,
          child: _BackgroundCircle(
            size: 216.w,
            blur: 269,
            color: AppColors.topGradient,
          ),
        ),

        Positioned(
          right: context.isArabic ? null : -90.w,
          left: context.isArabic ? -90.w : null,
          bottom: -74.h,
          child: _BackgroundCircle(
            size: 257.w,
            blur: 121,
            color: AppColors.bottomGradient,
          ),
        ),

        child,
      ],
    );
  }
}

class _BackgroundCircle extends StatelessWidget {
  const _BackgroundCircle({
    required this.size,
    required this.color,
    required this.blur,
  });
  final double size;
  final Color color;
  final double blur;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
