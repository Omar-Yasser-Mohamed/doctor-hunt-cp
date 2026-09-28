part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {}

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

  @override
  List<Object?> get props => [
    name,
    email,
    password,
    userRole,
  ];
}
  