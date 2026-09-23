part of 'google_bloc.dart';

sealed class GoogleState {}

final class GoogleInitial extends GoogleState {}

final class GoogleLoading extends GoogleState {}

final class GoogleSuccess extends GoogleState {}

final class GoogleFailure extends GoogleState {
  final String failure;
  GoogleFailure({required this.failure});
}
