import 'package:doctor_hunt/app/core/constants/maps_constants.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

class LocationMapView extends StatelessWidget {
  const LocationMapView({
    super.key,
    required this.latitude,
    required this.longitude,
    this.height,
    this.width,
    this.borderRadius,
    this.zoom = 15.0,
  });

  final double latitude;
  final double longitude;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final double zoom;

  @override
  Widget build(BuildContext context) {
    final point = LatLng(latitude, longitude);

    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(12.r),
      child: Container(
        height: height ?? 160.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: AppColors.lightGray,
          borderRadius: borderRadius ?? BorderRadius.circular(12.r),
          border: Border.all(
            color: AppColors.border,
            width: 1,
          ),
        ),
        child: FlutterMap(
          options: MapOptions(
            initialCenter: point,
            initialZoom: zoom,
            interactionOptions: const InteractionOptions(
              flags: InteractiveFlag.none,
            ),
          ),
          children: [
            TileLayer(
              urlTemplate: MapsConstants.openStreetMapTileUrl,
              userAgentPackageName: MapsConstants.userAgentPackageName,
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: point,
                  width: 42,
                  height: 42,
                  alignment: Alignment.topCenter,
                  child: const Icon(
                    Icons.location_pin,
                    color: AppColors.primary,
                    size: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
