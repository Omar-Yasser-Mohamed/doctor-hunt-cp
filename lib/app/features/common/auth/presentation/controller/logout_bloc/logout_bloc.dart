import 'package:doctor_hunt/app/features/common/auth/data/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'logout_event.dart';
part 'logout_state.dart';

@injectable
class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthRepo _authRepo;
  LogoutBloc(this._authRepo) : super(LogoutInitial()) {
    on<LogoutSubmitted>(_onLogoutSubmitted);
  }

  Future<void> _onLogoutSubmitted(
    LogoutSubmitted event,
    Emitter<LogoutState> emit,
  ) async {
    emit(LogoutLoading());
    final result = await _authRepo.logout();
    result.fold(
      (failure) => emit(LogoutFailure(failure)),
      (success) => emit(LogoutSuccess()),
    );
  }
}
