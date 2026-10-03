import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/widgets/admin_doctor_card.dart';
import 'package:flutter/material.dart';

class AdminDoctorsListView extends StatelessWidget {
  const AdminDoctorsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const AdminDoctorCard();
      },
    );
  }
}
