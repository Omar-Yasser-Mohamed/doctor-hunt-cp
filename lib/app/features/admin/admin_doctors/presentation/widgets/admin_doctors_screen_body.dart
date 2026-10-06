import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/data/models/doctors_stats.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/controller/admin_doctors_bloc/admin_doctors_bloc.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/widgets/admin_doctors_app_bar.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/widgets/admin_doctors_filters_list.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/widgets/admin_doctors_header.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/widgets/admin_doctors_list_builder.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/widgets/no_doctors_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminDoctorsScreenBody extends StatefulWidget {
  const AdminDoctorsScreenBody({
    super.key,
    required this.doctorsStats,
    required this.doctors,
    required this.specialtyCounts,
  });
  final DoctorsStats doctorsStats;
  final List<DoctorModel> doctors;
  final Map<String, int> specialtyCounts;

  @override
  State<AdminDoctorsScreenBody> createState() => _AdminDoctorsScreenBodyState();
}

class _AdminDoctorsScreenBodyState extends State<AdminDoctorsScreenBody> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<AdminDoctorsBloc>().add(const LoadMoreDoctorsEvent());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        const AdminDoctorsAppBar(),

        const SliverToBoxAdapter(
          child: AdminDoctorsHeader(),
        ),

        SliverToBoxAdapter(child: 14.height),

        if (widget.doctorsStats.totalDoctors > 0) ...[
          SliverToBoxAdapter(
            child: SizedBox(
              height: 28.h,
              child: AdminDoctorsFiltersList(
                specialtyCounts: widget.specialtyCounts,
              ),
            ),
          ),

          const AdminDoctorsListSection(),
        ] else ...[
          SliverToBoxAdapter(
            child: SizedBox(
              height: 464.h,
              child: const NoDoctorsWidget(),
            ),
          ),
        ],
      ],
    );
  }
}
