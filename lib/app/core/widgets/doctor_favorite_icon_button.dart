import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/features/patient/patient_favorite_doctors/presentation/controller/patient_favorite_doctors_bloc/patient_favorite_doctors_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorFavoriteIconButton extends StatelessWidget {
  const DoctorFavoriteIconButton({
    super.key,
    required this.doctor,
    this.iconSize = 16,
  });

  final DoctorModel doctor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      PatientFavoriteDoctorsBloc,
      PatientFavoriteDoctorsState
    >(
      builder: (context, state) {
        final bloc = context.read<PatientFavoriteDoctorsBloc>();
        final bool isFav = bloc.isDoctorInFavorites(doctor.id);
        return GestureDetector(
          onTap: () {
            bloc.add(
              ToggleDoctorInFavoritesEvent(
                doctor: doctor,
                isFavorite: isFav,
              ),
            );
          },
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Icon(
              key: ValueKey(isFav),
              isFav ? Icons.favorite : Icons.favorite_border,
              color: isFav ? Colors.red : AppColors.unselectedIcon,
              size: iconSize,
            ),
          ),
        );
      },
    );
  }
}
