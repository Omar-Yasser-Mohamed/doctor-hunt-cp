import 'package:doctor_hunt/app/core/error/failure_code.dart';

abstract class Failure {
  final String message;
  final FailureCode code;

  const Failure({required this.message, required this.code});
}

class AppFailure extends Failure {
  const AppFailure({required super.message, required super.code});
}