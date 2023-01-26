import 'package:mine_clicker/core/_core_exports.dart';

class UserInfoModel extends UserInfo {
  UserInfoModel({
    required super.ingotCount,
    required super.currentLevel,
    required super.currentPickaxeLevel,
  });

  UserInfoModel.fromJson(Map<String, dynamic> json)
      : super(
          currentLevel: json["currentLevel"],
          currentPickaxeLevel: json["currentPickaxeLevel"],
          ingotCount: json["ingotCount"],
        );

  Map<String, dynamic> toJson() {
    return {
      'currentLevel': currentLevel,
      'currentPickaxeLevel': currentPickaxeLevel,
      "ingotCount": ingotCount,
    };
  }

  UserInfoModel.fromEntity(UserInfo userInfo)
      : super(
          currentLevel: userInfo.currentLevel,
          currentPickaxeLevel: userInfo.currentPickaxeLevel,
          ingotCount: userInfo.ingotCount,
        );
}
