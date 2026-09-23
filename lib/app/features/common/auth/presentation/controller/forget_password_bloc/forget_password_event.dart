part of 'forget_password_bloc.dart';

sealed class ForgetPasswordEvent {}

final class ForgetPasswordRequested extends ForgetPasswordEvent {
  final String email;
  ForgetPasswordRequested(this.email);
}

final class OtpVerified extends ForgetPasswordEvent {
  final String otp;
  OtpVerified({required this.otp});
}

final class ResetPasswordRequested extends ForgetPasswordEvent {
  final String password;
  ResetPasswordRequested({required this.password});
}
