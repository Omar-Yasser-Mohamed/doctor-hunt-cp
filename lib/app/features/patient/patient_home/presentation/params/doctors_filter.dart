import 'package:doctor_hunt/app/core/shared/enums/doctor_specialty.dart';
import 'package:doctor_hunt/generated/translations.g.dart';

enum DoctorsListType {
  popular,
  topRated,
  category;
}

class DoctorsFilter {
  final DoctorsListType type;
  final DoctorSpecialty? category;

  const DoctorsFilter({required this.type, this.category});

  String get title {
    switch (type) {
      case DoctorsListType.popular:
        return t.popularDoctors;

      case DoctorsListType.topRated:
        return t.topRatedDoctors;

      case DoctorsListType.category:
        return category?.title ?? t.doctors;
    }
  }
}