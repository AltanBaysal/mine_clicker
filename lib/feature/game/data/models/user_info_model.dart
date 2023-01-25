import 'package:mine_clicker/feature/game/domain/entities/user_info.dart';

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
}
