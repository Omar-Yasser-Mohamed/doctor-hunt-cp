import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DynamicRatingStars extends StatelessWidget {
  const DynamicRatingStars({
    super.key,
    required this.rating,
    this.size,
    this.iconColor,
  });
  final double rating;
  final double? size;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final int fullStars = rating.floor();
    final bool hasHalfStar = (rating - fullStars) >= 0.5;
    final int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Full stars
        ...List.generate(
          fullStars,
          (index) => Icon(
            Icons.star_rounded,
            color: iconColor ?? AppColors.yellow,
            size: size ?? 24,
          ),
        ),

        // Half star
        if (hasHalfStar)
          Icon(
            Icons.star_half_rounded,
            color: iconColor ?? AppColors.yellow,
            size: size ?? 24,
          ),

        // Empty stars
        ...List.generate(
          emptyStars,
          (index) => Icon(
            Icons.star_rounded,
            color: iconColor ?? AppColors.gray200,
            size: size ?? 24,
          ),
        ),
      ],
    );
  }
}