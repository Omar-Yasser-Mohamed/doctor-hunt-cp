import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/routing/app_routes.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/custom_network_image.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/widgets/shimmers/patient_home_shimmer.dart';
import 'package:doctor_hunt/app/core/widgets/dynamic_rating_stars.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/controller/patient_home_bloc/patient_home_bloc.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularDoctorsListView extends StatefulWidget {
  const PopularDoctorsListView({super.key, required this.doctors});
  final List<DoctorModel> doctors;

  @override
  State<PopularDoctorsListView> createState() => _PopularDoctorsListViewState();
}

class _PopularDoctorsListViewState extends State<PopularDoctorsListView> {
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
        const LoadMorePopularDoctors(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoadingMore =
        context.watch<PatientHomeBloc>().state is PatientMorePopularLoading;
    return ListView.builder(
      controller: _scrollController,
      clipBehavior: Clip.none,
      padding: EdgeInsetsDirectional.only(start: 20.w, end: 4.w),
      scrollDirection: Axis.horizontal,
      itemCount: widget.doctors.length + (isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (isLoadingMore && index == widget.doctors.length) {
          return const PopularDoctorCardShimmer();
        }
        return PopularDoctorCard(
          key: ValueKey(widget.doctors[index].id),
          doctor: widget.doctors[index],
        );
      },
    );
  }
}

class PopularDoctorCard extends StatelessWidget {
  const PopularDoctorCard({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        const PatientDoctorDetailsRoute().push(context);
      },
      child: Container(
        width: 190.w,
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsetsDirectional.only(end: 16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 40,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: CustomNetworkImage(
                imageUrl: doctor.photo!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    doctor.name,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.medium18TextMain,
                  ),

                  Text(
                    "${doctor.specialty.title} ${t.Specialist}",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.light12.copyWith(
                      color: AppColors.textSub.withValues(alpha: .8),
                    ),
                  ),

                  4.height,

                  DynamicRatingStars(
                    rating: doctor.rating,
                    size: 22,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
