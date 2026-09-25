import 'package:doctor_hunt/app/core/error/failure_code.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final FailureCode code;

  const Failure({required this.message, required this.code});

  @override
  List<Object?> get props => [message, code];
}

class AppFailure extends Failure {
  const AppFailure({required super.message, required super.code});
}
