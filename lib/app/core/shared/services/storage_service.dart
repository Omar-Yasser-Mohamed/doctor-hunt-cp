import 'dart:convert';

import 'package:doctor_hunt/app/core/constants/hive_constants.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class StorageService {
  final Box _box;

  StorageService(this._box);

  @preResolve
  @factoryMethod
  static Future<StorageService> create() async {
    await Hive.initFlutter();
    final box = await Hive.openBox(HiveConstants.appBox);
    return StorageService(box);
  }

  // for String
  Future<void> saveString(String key, String value) async {
    await _box.put(key, value);
  }

  String? getString(String key) {
    return _box.get(key) as String?;
  }

  // for bool
  Future<void> saveBool(String key, bool value) async {
    await _box.put(key, value);
  }

  bool? getBool(String key) {
    return _box.get(key) as bool?;
  }

  // for int
  Future<void> saveInt(String key, int value) async {
    await _box.put(key, value);
  }

  int? getInt(String key) {
    return _box.get(key) as int?;
  }

  // for double
  Future<void> saveDouble(String key, double value) async {
    await _box.put(key, value);
  }

  double? getDouble(String key) {
    return _box.get(key) as double?;
  }

  // fro map
  Future<void> saveMap(String key, Map<String, dynamic> map) async {
    final jsonString = jsonEncode(map);
    await _box.put(key, jsonString);
  }

  Map<String, dynamic>? getMap(String key) {
    final jsonString = _box.get(key) as String?;
    if (jsonString == null) return null;
    try {
      return jsonDecode(jsonString) as Map<String, dynamic>;
    } catch (_) {
      return null;
    }
  }

  // for model
  Future<void> saveModel<T>(
    String key,
    T model,
    Map<String, dynamic> Function(T) toJson,
  ) async {
    final map = toJson(model);
    await saveMap(key, map);
  }

  T? getModel<T>(String key, T Function(Map<String, dynamic>) fromJson) {
    final map = getMap(key);
    if (map == null) return null;
    try {
      return fromJson(map);
    } catch (_) {
      return null;
    }
  }

  // Common function
  Future<void> remove(String key) async {
    await _box.delete(key);
  }

  Future<void> clearAuthData() async {
    await remove(HiveConstants.userKey);
  }

  Future<void> clearAll() async {
    await _box.clear();
  }
}