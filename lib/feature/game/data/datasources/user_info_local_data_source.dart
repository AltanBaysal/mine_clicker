import 'package:mine_clicker/core/_core_exports.dart';

abstract class UserInfoLocalDataSource {
  Future<UserInfo> getSavedUserInfo();
  Future<void> saveUserInfo(UserInfoModel userInfoModel);
}

class UserInfoLocalDataSourceImpl implements UserInfoLocalDataSource {
  final SharedPreferences sharedPreferences;
  UserInfoLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> saveUserInfo(UserInfoModel userInfoModel) async {
    await sharedPreferences.setString(
      SharedPreferencesKeys.savedUserInfo,
      jsonEncode(userInfoModel.toJson()),
    );
  }

  @override
  Future<UserInfo> getSavedUserInfo() async {
    final jsonString = sharedPreferences.getString(
      SharedPreferencesKeys.savedUserInfo,
    );
    if (jsonString != null) {
      return Future.value(UserInfoModel.fromJson(jsonDecode(jsonString)));
    }
    throw CacheException();
  }
}
