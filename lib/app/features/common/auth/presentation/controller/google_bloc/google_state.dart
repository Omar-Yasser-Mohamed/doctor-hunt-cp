part of 'google_bloc.dart';

sealed class GoogleState {}

final class GoogleInitial extends GoogleState {}

final class GoogleLoading extends GoogleState {}

final class GoogleSuccess extends GoogleState {
  final UserModel user;
  GoogleSuccess(this.user);
}

final class GoogleFailure extends GoogleState {
  final Failure failure;
  GoogleFailure({required this.failure});
}
