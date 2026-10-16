import 'package:equatable/equatable.dart';

class AppointmentSlot extends Equatable {
  final DateTime date;

  const AppointmentSlot({
    required this.date,
  });

  @override
  List<Object?> get props => [date];
}
