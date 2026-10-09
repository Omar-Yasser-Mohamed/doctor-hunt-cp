import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/features/patient/patient_find_doctors/presentation/controller/find_doctors_bloc/find_doctors_bloc.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/widgets/doctor_card.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/widgets/shimmers/doctor_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientFindDoctorsListView extends StatefulWidget {
  const PatientFindDoctorsListView({super.key, required this.doctors});
  final List<DoctorModel> doctors;

  @override
  State<PatientFindDoctorsListView> createState() =>
      _PatientFindDoctorsListViewState();
}

class _PatientFindDoctorsListViewState
    extends State<PatientFindDoctorsListView> {
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<FindDoctorsBloc>().add(LoadMoreDoctorsEvent());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoadingMore =
        context.watch<FindDoctorsBloc>().state is FindDoctorsPaginationLoading;
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.only(
        top: 16,
        bottom: context.bottomPadding + 8,
        left: 20.w,
        right: 20.w,
      ),
      itemCount: widget.doctors.length + (isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (isLoadingMore && index == widget.doctors.length) {
          return const DoctorCardShimmer();
        }
        return DoctorCard(doctor: widget.doctors[index]);
      },
    );
  }
}
