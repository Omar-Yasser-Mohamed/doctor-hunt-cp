import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/widgets/location_map_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorLocationSection extends StatelessWidget {
  const DoctorLocationSection({
    super.key,
    required this.latitude,
    required this.longitude,
  });
  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.08),
            blurRadius: 30,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: LocationMapView(
        latitude: latitude,
        longitude: longitude,
        height: 190.h,
        borderRadius: BorderRadius.circular(10.r),
      ),
    );
  }
}
