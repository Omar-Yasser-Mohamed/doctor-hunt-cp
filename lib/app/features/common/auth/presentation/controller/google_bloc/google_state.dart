part of 'google_bloc.dart';

sealed class GoogleState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class GoogleInitial extends GoogleState {}

final class GoogleLoading extends GoogleState {}

final class GoogleSuccess extends GoogleState {
  final UserModel user;
  GoogleSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

final class GoogleFailure extends GoogleState {
  final Failure failure;
  GoogleFailure({required this.failure});

  @override
  List<Object?> get props => [failure];
}
