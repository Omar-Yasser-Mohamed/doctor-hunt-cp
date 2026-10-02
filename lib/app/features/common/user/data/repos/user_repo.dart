import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/current_user_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';

abstract class UserRepo {
  Future<Either<Failure,void>> saveUser(CurrentUserModel user);
  Future<Either<Failure,CurrentUserModel?>> getUser();
  Future<Either<Failure,void>> removeUser();
}
