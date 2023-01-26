import 'package:dartz/dartz.dart';
import 'package:mine_clicker/core/_core_exports.dart';

abstract class UserInfoRepository {
  Future<Either<Failure, UserInfo>> getSavedUserInfo();
  Future<Either<Failure, void>> saveUserInfo(UserInfoModel userInfoModel);
}
