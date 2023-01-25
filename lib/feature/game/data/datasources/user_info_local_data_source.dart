import 'dart:convert';

import 'package:mine_clicker/feature/game/data/models/user_info_model.dart';
import 'package:mine_clicker/feature/game/domain/entities/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/keys.dart';
import '../../../../core/error/exceptions.dart';

abstract class UserInfoLocalDataSource {
  Future<UserInfo> getSavedUserInfo();
  Future<void> saveUserInfo(UserInfoModel userInfoModel);
}

class UserInfoLocalDataSourceImpl implements UserInfoLocalDataSource {
  final SharedPreferences sharedPreferences;
  UserInfoLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> saveUserInfo(UserInfoModel userInfoModel) async {
    sharedPreferences.setString(
      jsonEncode(userInfoModel.toJson()),
      SharedPreferencesKeys.savedUserInfo,
    );
  }

  @override
  Future<UserInfo> getSavedUserInfo() async {
    final jsonString =
        sharedPreferences.getString(SharedPreferencesKeys.savedUserInfo);
    if (jsonString != null) {
      return Future.value(UserInfoModel.fromJson(jsonDecode(jsonString)));
    }
    throw CacheException();
  }
}
