import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/controller/admin_doctors_bloc/admin_doctors_bloc.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/widgets/admin_doctor_card.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/widgets/admin_doctors_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminDoctorsListView extends StatelessWidget {
  const AdminDoctorsListView({
    super.key,
    required this.doctors,
  });
  final List<DoctorModel> doctors;

  @override
  Widget build(BuildContext context) {
    final isLoadingMore = context.watch<AdminDoctorsBloc>().state is AdminDoctorsPaginationLoading;
    return SliverList.builder(
      itemCount: doctors.length + (isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if(isLoadingMore && index == doctors.length){
          return const AdminDoctorCardShimmer();
        }
        return AdminDoctorCard(doctor: doctors[index]);
      },
    );
  }
}
