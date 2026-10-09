part of 'logout_bloc.dart';

sealed class LogoutEvent extends Equatable {
  const LogoutEvent();

  @override
  List<Object> get props => [];
}

class LogoutSubmitted extends LogoutEvent {
  const LogoutSubmitted();

  @override
  List<Object> get props => [];
}