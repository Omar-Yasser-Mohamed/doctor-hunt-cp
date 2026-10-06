import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.radius = 0.0,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit fit;
  final double radius;

  Widget _buildPlaceholder(BuildContext context) {
    return AppShimmer(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.gray200,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }

  Widget _buildErrorWidget(BuildContext context) {
    final double iconSize;
    if (width != null && height != null) {
      final minDimension = width! < height!;
      iconSize = (minDimension ? width! * 0.35 : height! * 0.35).clamp(16.0, 36.0);
    } else if (width != null) {
      iconSize = (width! * 0.35).clamp(16.0, 36.0);
    } else if (height != null) {
      iconSize = (height! * 0.35).clamp(16.0, 36.0);
    } else {
      iconSize = 24.0;
    }

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: AppColors.border,
          width: 1,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.broken_image_rounded,
          size: iconSize,
          color: AppColors.textPlaceholder,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final trimmedUrl = imageUrl.trim();

    if (trimmedUrl.isEmpty) {
      return _buildErrorWidget(context);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        imageUrl: trimmedUrl,
        height: height,
        width: width,
        fit: fit,
        placeholder: (context, url) => _buildPlaceholder(context),
        errorWidget: (context, url, error) => _buildErrorWidget(context),
      ),
    );
  }
}