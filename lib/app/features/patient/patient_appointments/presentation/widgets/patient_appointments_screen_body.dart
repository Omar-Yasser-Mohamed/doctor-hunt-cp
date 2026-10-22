import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/features/patient/patient_appointments/presentation/controller/patient_appointments_bloc/patient_appointments_bloc.dart';
import 'package:doctor_hunt/app/features/patient/patient_appointments/presentation/widgets/patient_appointments_bloc_consumer.dart';
import 'package:doctor_hunt/app/features/patient/patient_appointments/presentation/widgets/patient_appointments_header_tabs.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientAppointmentsScreenBody extends StatefulWidget {
  const PatientAppointmentsScreenBody({super.key});

  @override
  State<PatientAppointmentsScreenBody> createState() => _PatientAppointmentsScreenBodyState();
}

class _PatientAppointmentsScreenBodyState extends State<PatientAppointmentsScreenBody> {
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
      context.read<PatientAppointmentsBloc>().add(const GetMorePatientAppointmentsEvent());
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const _PatientAppointmentsAppBar(),

          const SliverPersistentHeader(
            pinned: true,
            delegate: PatientAppointmentsTabs(),
          ),

          SliverPadding(
            padding: EdgeInsets.only(
              top: 10,
              left: 20.w,
              right: 20.w,
              bottom: context.bottomPadding + 16,
            ),
            sliver: const PatientAppointmentsBlocConsumer(),
          ),
        ],
      ),
    );
  }
}

class _PatientAppointmentsAppBar extends StatelessWidget {
  const _PatientAppointmentsAppBar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      titleSpacing: 20.w,
      toolbarHeight: kToolbarHeight,
      title: Text(
        t.appointments,
        style: context.medium18TextMain,
      ),
    );
  }
}
