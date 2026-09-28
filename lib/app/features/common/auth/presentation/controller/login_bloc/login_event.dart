part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {}

final class LoginSubmitted extends LoginEvent {
  LoginSubmitted({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
