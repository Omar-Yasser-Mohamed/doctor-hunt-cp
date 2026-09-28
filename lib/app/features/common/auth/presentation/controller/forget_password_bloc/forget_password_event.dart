part of 'forget_password_bloc.dart';

abstract class ForgetPasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ForgetPasswordRequested extends ForgetPasswordEvent {
  final String email;
  ForgetPasswordRequested(this.email);
  @override
  List<Object?> get props => [email];
}

final class OtpVerified extends ForgetPasswordEvent {
  final String otp;
  OtpVerified({required this.otp});

  @override
  List<Object?> get props => [otp];
}

final class ResetPasswordRequested extends ForgetPasswordEvent {
  final String password;
  ResetPasswordRequested({required this.password});

  @override
  List<Object?> get props => [password];
}
