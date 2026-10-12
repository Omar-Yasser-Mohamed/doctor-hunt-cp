import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/app_back_button.dart';
import 'package:doctor_hunt/app/core/widgets/app_text_field.dart';
import 'package:doctor_hunt/app/features/common/location/presentation/controller/location_picker_bloc/location_picker_bloc.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationHeaderBar extends StatefulWidget {
  const LocationHeaderBar({super.key});

  @override
  State<LocationHeaderBar> createState() => _LocationHeaderBarState();
}

class _LocationHeaderBarState extends State<LocationHeaderBar> {
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppBackButton(
                  size: 36.w,
                  margin: EdgeInsets.zero,
                ),
                10.width,
                Expanded(
                  child: Container(
                    height: 36.w,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withValues(alpha: 0.08),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: AppTextField(
                      controller: _controller,
                      hintText: t.searchPlaces,
                      hintStyle: context.regular12TextPlaceholder,
                      textStyle: context.regular14TextMain,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(
                        Icons.search_rounded,
                        color: AppColors.secondary,
                        size: 20,
                      ),
                      suffixIcon: _controller.text.isNotEmpty
                          ? IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
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
                      suffixIconConstraints: const BoxConstraints(
                        minWidth: 44,
                        minHeight: 44,
                      ),
                      prefixIconConstraints: const BoxConstraints(
                        minWidth: 40,
                        minHeight: 44,
                      ),
                      onChanged: (query) {
                        context.read<LocationPickerBloc>().add(
                          SearchPlacesEvent(query: query),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            if (state.isSearching) ...[
              8.height,
              Container(
                height: 56.h,
                alignment: Alignment.center,
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
                child: const SizedBox.square(
                  dimension: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ] else if (state.searchResults.isNotEmpty) ...[
              8.height,
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
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12.r),
                  clipBehavior: Clip.antiAlias,
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
              ),
            ],
          ],
        );
      },
    );
  }
}
