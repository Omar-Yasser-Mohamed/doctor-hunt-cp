import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/features/common/auth/data/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

@injectable
class ForgetPasswordBloc extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc(this._authRepo) : super(ForgetPasswordInitial()) {
    on<ForgetPasswordRequested>(_onForgetPasswordRequested);
    on<OtpVerified>(_onOtpVerified);
    on<ResetPasswordRequested>(_onResetPasswordRequested);
  }
  final AuthRepo _authRepo;

  String _email = '';

  Future<void> _onForgetPasswordRequested(
    ForgetPasswordRequested event,
    Emitter<ForgetPasswordState> emit,
  ) async {
    emit(ForgetPasswordLoading());

    final result = await _authRepo.forgetPassword(event.email);

    result.fold(
      (failure) => emit(ForgetPasswordFailure(failure)),
      (success) {
        _email = event.email;
        emit(ForgetPasswordSuccess(event.email));
      },
    );
  }

  Future<void> _onOtpVerified(
    OtpVerified event,
    Emitter<ForgetPasswordState> emit,
  ) async {
    emit(VerifyOtpLoading());

    final result = await _authRepo.verifyOtp(_email, event.otp);

    result.fold(
      (failure) => emit(ForgetPasswordFailure(failure)),
      (success) => emit(VerifyOtpSuccess()),
    );
  }

  Future<void> _onResetPasswordRequested(
    ResetPasswordRequested event,
    Emitter<ForgetPasswordState> emit,
  ) async {
    emit(ResetPasswordLoading());

    final result = await _authRepo.resetPassword(event.password);

    result.fold(
      (failure) => emit(ForgetPasswordFailure(failure)),
      (success) => emit(ResetPasswordSuccess()),
    );
  }
}
