import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/app_text_field.dart';
import 'package:doctor_hunt/app/features/common/location/presentation/controller/location_picker_bloc/location_picker_bloc.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationSearchBar extends StatefulWidget {
  const LocationSearchBar({super.key});

  @override
  State<LocationSearchBar> createState() => _LocationSearchBarState();
}

class _LocationSearchBarState extends State<LocationSearchBar> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationPickerBloc, LocationPickerState>(
      listenWhen: (previous, current) =>
          previous.address != current.address &&
          current.address != null &&
          _controller.text.isEmpty,
      listener: (context, state) {
        if (state.address != null && _controller.text.isEmpty) {
          _controller.text = state.address!;
        }
      },
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: AppTextField(
                controller: _controller,
                hintText: t.searchPlaces,
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: AppColors.secondary,
                  size: 20,
                ),
                suffixIcon: state.isSearching
                    ? const Padding(
                        padding: EdgeInsets.all(12),
                        child: SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.primary,
                          ),
                        ),
                      )
                    : _controller.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(
                              Icons.close_rounded,
                              color: AppColors.secondary,
                              size: 18,
                            ),
                            onPressed: () {
                              _controller.clear();
                              context.read<LocationPickerBloc>().add(
                                    const SearchPlacesEvent(query: ''),
                                  );
                            },
                          )
                        : null,
                onChanged: (query) {
                  context.read<LocationPickerBloc>().add(
                        SearchPlacesEvent(query: query),
                      );
                },
              ),
            ),
            if (state.searchResults.isNotEmpty) ...[
              6.height,
              Container(
                constraints: BoxConstraints(maxHeight: 220.h),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: 0.08),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: state.searchResults.length,
                  separatorBuilder: (_, _) => const Divider(
                    height: 1,
                    color: AppColors.border,
                  ),
                  itemBuilder: (context, index) {
                    final place = state.searchResults[index];
                    return ListTile(
                      dense: true,
                      leading: const Icon(
                        Icons.location_on_outlined,
                        color: AppColors.primary,
                        size: 20,
                      ),
                      title: Text(
                        place.address,
                        style: context.regular14TextMain,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {
                        _controller.text = place.address;
                        FocusScope.of(context).unfocus();
                        context.read<LocationPickerBloc>().add(
                              SelectSearchResultEvent(location: place),
                            );
                      },
                    );
                  },
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
