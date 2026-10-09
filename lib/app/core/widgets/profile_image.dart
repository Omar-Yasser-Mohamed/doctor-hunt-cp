import 'package:doctor_hunt/app/core/extensions/string_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    this.size,
    this.imageUrl,
    required this.name,
    this.avatarTextStyle,
    this.backgroundColor,
    this.boxShadow,
    this.decoration,
    this.border,
  });
  final String name;
  final String? imageUrl;
  final double? size;
  final TextStyle? avatarTextStyle;
  final Color? backgroundColor;
  final List<BoxShadow>? boxShadow;
  final Decoration? decoration;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 36.w,
      width: size ?? 36.w,
      alignment: Alignment.center,
      decoration: decoration ??
          BoxDecoration(
            color: backgroundColor ?? AppColors.primary,
            shape: BoxShape.circle,
            border: border,
            boxShadow: boxShadow,
          ),
      child: imageUrl != null
          ? CustomNetworkImage(
              imageUrl: imageUrl!,
              height: size ?? 36.w,
              width: size ?? 36.w,
              radius: 9999,
            )
          : Text(
              name.toAvatar,
              style: avatarTextStyle ?? context.bold14White,
            ),
    );
  }
}
