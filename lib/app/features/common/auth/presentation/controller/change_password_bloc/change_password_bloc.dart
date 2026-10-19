import 'package:doctor_hunt/app/features/common/auth/data/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

@injectable
class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final AuthRepo _authRepo;

  ChangePasswordBloc(this._authRepo) : super(ChangePasswordInitial()) {
    on<SubmitChangePasswordEvent>(_onChangePassword);
  }

  Future<void> _onChangePassword(
    SubmitChangePasswordEvent event,
    Emitter<ChangePasswordState> emit,
  ) async {
    emit(ChangePasswordLoading());

    final result = await _authRepo.changePassword(
      currentPassword: event.currentPassword,
      newPassword: event.newPassword,
    );

    result.fold(
      (failure) => emit(ChangePasswordFailure(failure: failure)),
      (value) => emit(ChangePasswordSuccess()),
    );
  }
}
