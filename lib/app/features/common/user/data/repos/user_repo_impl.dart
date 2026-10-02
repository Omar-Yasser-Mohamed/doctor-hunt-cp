import 'package:doctor_hunt/app/core/error/error_handler.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/current_user_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/common/user/data/repos/user_repo.dart';
import 'package:doctor_hunt/app/features/common/user/data/services/user_local_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserRepo)
class UserRepoImpl implements UserRepo {
  UserRepoImpl(this._userLocalService);
  final UserLocalService _userLocalService;

  @override
  Future<Either<Failure,void>> saveUser(CurrentUserModel user) async {
    try {
      await _userLocalService.saveUser(user);
      return const Right(null);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure,CurrentUserModel?>> getUser() async {
    try {
      return Right(_userLocalService.getUser());
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure,void>> removeUser() async {
    try {
      await _userLocalService.removeUser();
      return const Right(null);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}