part of 'register_bloc.dart';

sealed class RegisterEvent {}

final class RegisterSubmitted extends RegisterEvent {
  RegisterSubmitted({
    required this.name,
    required this.email,
    required this.password,
    required this.userRole,
  });
  final String name;
  final String email;
  final String password;
  final UserRole userRole;
}
  