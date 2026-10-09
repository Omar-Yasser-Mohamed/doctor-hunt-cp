import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/routing/app_routes.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/widgets/shimmers/patient_home_shimmer.dart';
import 'package:doctor_hunt/app/core/widgets/custom_network_image.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/controller/patient_home_bloc/patient_home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopRatedDoctorsListView extends StatefulWidget {
  const TopRatedDoctorsListView({super.key, required this.doctors});
  final List<DoctorModel> doctors;

  @override
  State<TopRatedDoctorsListView> createState() => _TopRatedDoctorsListViewState();
}

class _TopRatedDoctorsListViewState extends State<TopRatedDoctorsListView> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<PatientHomeBloc>().add(
        const LoadMoreTopRatedDoctors(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoadingMore =
        context.watch<PatientHomeBloc>().state is PatientMoreTopRatedLoading;

    return ListView.builder(
      controller: _scrollController,
      clipBehavior: Clip.none,
      padding: EdgeInsetsDirectional.only(start: 20.w, end: 6.w),
      itemCount: widget.doctors.length + (isLoadingMore ? 1 : 0),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        if (isLoadingMore && index == widget.doctors.length) {
          return const TopRatedDoctorCardShimmer();
        }
        return TopRatedDoctorCard(
          key: ValueKey(widget.doctors[index].id),
          doctor: widget.doctors[index],
        );
      },
    );
  }
}

class TopRatedDoctorCard extends StatefulWidget {
  const TopRatedDoctorCard({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  State<TopRatedDoctorCard> createState() => _TopRatedDoctorCardState();
}

class _TopRatedDoctorCardState extends State<TopRatedDoctorCard> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PatientDoctorDetailsRoute($extra: widget.doctor.id).push(context);
      },
      child: Container(
        width: 96.w,
        padding: const EdgeInsets.all(9),
        margin: EdgeInsetsDirectional.only(end: 12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: .06),
              blurRadius: 20.r,
              offset: Offset(0, 1.h),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFav = !isFav;
                    });
                  },
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      key: ValueKey(isFav),
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: isFav ? Colors.red : AppColors.unselectedIcon,
                      size: 16,
                    ),
                  ),
                ),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.star,
                      color: AppColors.yellow,
                      size: 16,
                    ),

                    3.width,

                    Text(
                      widget.doctor.rating.toStringAsFixed(1),
                      style: context.medium11Black.copyWith(
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            8.height,

            CustomNetworkImage(
              imageUrl: widget.doctor.photo!,
              height: 54.w,
              width: 54.w,
              fit: BoxFit.cover,
              radius: 9999,
            ),

            12.height,

            Text(
              widget.doctor.name,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.medium12TextMain,
            ),
          ],
        ),
      ),
    );
  }
}
