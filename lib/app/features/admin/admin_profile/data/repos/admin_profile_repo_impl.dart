import 'package:doctor_hunt/app/core/error/error_handler.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/current_user_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/admin/admin_profile/data/models/update_admin_profile.dart';
import 'package:doctor_hunt/app/features/admin/admin_profile/data/repos/admin_profile_repo.dart';
import 'package:doctor_hunt/app/features/admin/admin_profile/data/services/admin_profile_service.dart';
import 'package:doctor_hunt/app/features/common/user/data/services/user_local_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AdminProfileRepo)
class AdminProfileRepoImpl implements AdminProfileRepo {
  AdminProfileRepoImpl(
    this._adminProfileService,
    this._userLocalService,
  );

  final AdminProfileService _adminProfileService;
  final UserLocalService _userLocalService;

  @override
  Future<Either<Failure, CurrentUserModel>> updateAdminProfile(
    UpdateAdminProfileRequest request,
  ) async {
    try {
      final updatedUser = await _adminProfileService.updateAdminProfile(request);
      await _userLocalService.saveUser(updatedUser);
      return Right(updatedUser);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
