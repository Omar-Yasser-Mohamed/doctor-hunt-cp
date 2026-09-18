import 'dart:ui';

import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.child,
    super.key,
    this.showTopDecoration = true,
    this.showBottomDecoration = true,
    this.topGradientLeftPos,
    this.topGradientRightPos,
    this.bottomGradientLeftPos,
    this.bottomGradientRightPos,
    this.topPos,
    this.bottomPos,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.resizeToAvoidBottomInset,
    this.backgroundColor,
  });
  final Widget child;
  final bool showTopDecoration;
  final bool showBottomDecoration;
  final double? topGradientLeftPos;
  final double? topGradientRightPos;
  final double? bottomGradientLeftPos;
  final double? bottomGradientRightPos;
  final double? topPos;
  final double? bottomPos;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final bool? resizeToAvoidBottomInset;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ColoredBox(
          color: backgroundColor ?? AppColors.white,
        ),
        if (showTopDecoration)
          Positioned(
            top: topPos ?? -33.h,
            left: topGradientLeftPos ?? (context.isArabic ? null : -99.w),
            right: topGradientRightPos ?? (context.isArabic ? -99.w : null),
            child: _BackgroundCircle(
              size: 216.w,
              blur: 269,
              color: AppColors.topGradient,
            ),
          ),

        if (showBottomDecoration)
          Positioned(
            right:
                bottomGradientRightPos ?? (context.isArabic ? null : -90.w),
            left: bottomGradientLeftPos ?? (context.isArabic ? -90.w : null),
            bottom: bottomPos ?? -74.h,
            child: _BackgroundCircle(
              size: 257.w,
              blur: 121,
              color: AppColors.bottomGradient,
            ),
          ),

        Scaffold(
          appBar: appBar,
          bottomNavigationBar: bottomNavigationBar,
          floatingActionButton: floatingActionButton,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          body: child,
        ),
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
