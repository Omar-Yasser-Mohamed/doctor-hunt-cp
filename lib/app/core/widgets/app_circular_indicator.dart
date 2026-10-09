import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppCircularIndicator extends StatelessWidget {
  const AppCircularIndicator({
    super.key,
    this.color,
    this.strokeWidth,
    this.size,
  });
  final Color? color;
  final double? strokeWidth;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          color: color ?? AppColors.primary,
          strokeWidth: strokeWidth ?? 2,
        ),
      ),
    );
  }
}