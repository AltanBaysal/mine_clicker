import 'package:dartz/dartz.dart';
import 'package:mine_clicker/feature/game/domain/entities/user_info.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/user_info_model.dart';

abstract class UserInfoRepository {
  Future<Either<Failure, UserInfo>> getSavedUserInfo();
  Future<Either<Failure, void>> saveUserInfo(UserInfoModel userInfoModel);
}
