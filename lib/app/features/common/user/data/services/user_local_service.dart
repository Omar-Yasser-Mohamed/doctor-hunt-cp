import 'package:doctor_hunt/app/core/constants/hive_constants.dart';
import 'package:doctor_hunt/app/core/shared/models/current_user_model.dart';
import 'package:doctor_hunt/app/core/shared/services/storage_service.dart';
import 'package:injectable/injectable.dart';

abstract class UserLocalService {
  Future<void> saveUser(CurrentUserModel user);
  CurrentUserModel? getUser();
  Future<void> removeUser();
}

@LazySingleton(as: UserLocalService)
class UserLocalServiceImpl implements UserLocalService {
  UserLocalServiceImpl(this._storageService);
  final StorageService _storageService;

  @override
  Future<void> saveUser(CurrentUserModel user) async {
    await _storageService.saveMap(HiveConstants.userKey, user.toJson());
  }

  @override
  CurrentUserModel? getUser() {
    final map = _storageService.getMap(HiveConstants.userKey);
    if (map == null) return null;
    return CurrentUserModel.fromJson(map);
  }

  @override
  Future<void> removeUser() =>
      _storageService.remove(HiveConstants.userKey);
}
