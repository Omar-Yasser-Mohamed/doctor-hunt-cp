import 'package:doctor_hunt/app/core/constants/maps_constants.dart';
import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/features/common/location/presentation/controller/location_picker_bloc/location_picker_bloc.dart';
import 'package:doctor_hunt/app/features/common/location/presentation/widgets/location_bottom_panel.dart';
import 'package:doctor_hunt/app/features/common/location/presentation/widgets/location_header_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

class LocationPickerScreenBody extends StatefulWidget {
  const LocationPickerScreenBody({super.key});

  @override
  State<LocationPickerScreenBody> createState() =>
      _LocationPickerScreenBodyState();
}

class _LocationPickerScreenBodyState extends State<LocationPickerScreenBody> {
  late final MapController _mapController;
  static const LatLng _initialCenter = LatLng(30.0444, 31.2357);

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  void _onLocationChanged(double lat, double lng) {
    _mapController.move(LatLng(lat, lng), 15.0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationPickerBloc, LocationPickerState>(
      listenWhen: (previous, current) =>
          current.hasLocation && current.shouldAnimateMap,
      listener: (context, state) {
        _onLocationChanged(state.latitude!, state.longitude!);
      },
      child: BlocBuilder<LocationPickerBloc, LocationPickerState>(
        buildWhen: (previous, current) =>
            previous.latitude != current.latitude ||
            previous.longitude != current.longitude ||
            previous.isLoadingLocation != current.isLoadingLocation ||
            previous.canConfirm != current.canConfirm,
        builder: (context, state) {
          final center = state.hasLocation
              ? LatLng(state.latitude!, state.longitude!)
              : _initialCenter;

          return Stack(
            children: [
              FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  initialCenter: center,
                  initialZoom: state.hasLocation ? 9.0 : 6.0,
                  onTap: (_, point) {
                    context.read<LocationPickerBloc>().add(
                      MapTappedEvent(
                        latitude: point.latitude,
                        longitude: point.longitude,
                      ),
                    );
                  },
                ),
                children: [
                  TileLayer(
                    urlTemplate: MapsConstants.openStreetMapTileUrl,
                    userAgentPackageName: MapsConstants.userAgentPackageName,
                  ),
                  if (state.hasLocation)
                    MarkerLayer(
                      markers: [
                        Marker(
                          alignment: Alignment.topCenter,
                          point: LatLng(state.latitude!, state.longitude!),
                          width: 42,
                          height: 42,
                          child: const Icon(
                            Icons.location_pin,
                            color: AppColors.primaryDark,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                ],
              ),

              Positioned(
                top: context.topPadding + 12,
                left: 20.w,
                right: 20.w,
                child: const LocationHeaderBar(),
              ),

              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(end: 20.w),
                      child: FloatingActionButton(
                        heroTag: 'my_location_btn',
                        backgroundColor: AppColors.white,
                        elevation: 4,
                        onPressed: state.isLoadingLocation
                            ? null
                            : () {
                                context.read<LocationPickerBloc>().add(
                                  const GetCurrentLocationEvent(),
                                );
                              },
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 250),
                          child: state.isLoadingLocation
                              ? const SizedBox(
                                  key: Key('loading'),
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: AppColors.primary,
                                  ),
                                )
                              : const Icon(
                                  key: Key('my_location'),
                                  Icons.my_location_rounded,
                                  color: AppColors.primary,
                                  size: 24,
                                ),
                        ),
                      ),
                    ),
                    16.height,
                    const LocationBottomPanel(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
