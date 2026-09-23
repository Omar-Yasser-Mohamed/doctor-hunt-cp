part of 'login_bloc.dart';

sealed class LoginEvent {}

final class LoginSubmitted extends LoginEvent {
  LoginSubmitted({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;
}
