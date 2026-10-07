import 'package:doctor_hunt/generated/translations.g.dart';

enum WeekDay {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday;

  String get title {
    return switch (this) {
      WeekDay.monday => t.monday,
      WeekDay.tuesday => t.tuesday,
      WeekDay.wednesday => t.wednesday,
      WeekDay.thursday => t.thursday,
      WeekDay.friday => t.friday,
      WeekDay.saturday => t.saturday,
      WeekDay.sunday => t.sunday,
    };
  }

  String get value => switch (this) {
    WeekDay.monday => 'Monday',
    WeekDay.tuesday => 'Tuesday',
    WeekDay.wednesday => 'Wednesday',
    WeekDay.thursday => 'Thursday',
    WeekDay.friday => 'Friday',
    WeekDay.saturday => 'Saturday',
    WeekDay.sunday => 'Sunday',
  };

  static List<WeekDay> listFromString(List<String> days) {
    return days
        .map(
          (e) => WeekDay.values.firstWhere(
            (element) =>
                element.name.toLowerCase() == e.toLowerCase() ||
                element.value.toLowerCase() == e.toLowerCase(),
          ),
        )
        .toList();
  }

  static List<String> listValues(List<WeekDay> days) {
    return days.map((e) => e.value).toList();
  }
}
