import 'package:doctor_hunt/app/features/admin/admin_appointments/presentation/widgets/admin_appointments_app_bar.dart';
import 'package:doctor_hunt/app/features/admin/admin_appointments/presentation/widgets/admin_appointments_bloc_consumer.dart';
import 'package:doctor_hunt/app/features/admin/admin_appointments/presentation/widgets/admin_appointments_header_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminAppointmentsScreenBody extends StatelessWidget {
  const AdminAppointmentsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const AdminAppointmentsAppBar(),

          const SliverPersistentHeader(
            pinned: true,
            delegate: AdminAppointmentsHeaderTabs(),
          ),

          SliverPadding(
            padding: EdgeInsets.only(top: 6, left: 20.w, right: 20.w),
            sliver: const AdminAppointmentsBlocConsumer(),
          ),
        ],
      ),
    );
  }
}
