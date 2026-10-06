import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  final Widget child;
  final Color? baseColor;
  final Color? highlightColor;

  const AppShimmer({
    super.key,
    required this.child,
    this.baseColor,
    this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? AppColors.gray200,
      highlightColor: highlightColor ?? AppColors.white,
      child: child,
    );
  }
}

/// Reusable shimmer container box for building placeholder layouts.
class AppShimmerBox extends StatelessWidget {
  final double? width;
  final double? height;
  final double borderRadius;
  final BoxShape shape;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? baseColor;
  final Color? highlightColor;

  const AppShimmerBox({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 16,
    this.shape = BoxShape.rectangle,
    this.margin,
    this.padding,
    this.baseColor,
    this.highlightColor,
  });

  const AppShimmerBox.circular({
    super.key,
    required double size,
    this.margin,
    this.padding,
    this.baseColor,
    this.highlightColor,
  }) : width = size,
       height = size,
       borderRadius = 0,
       shape = BoxShape.circle;

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: AppColors.gray200,
          shape: shape,
          borderRadius: shape == BoxShape.circle
              ? null
              : BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}