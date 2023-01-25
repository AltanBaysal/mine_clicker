import 'package:dartz/dartz.dart';
import 'package:mine_clicker/feature/game/domain/entities/user_info.dart';
import '../../../../core/error/failures.dart';

abstract class UserInfoRepository {
  Future<Either<Failure, UserInfo>> getNewUserInfo();
  Future<Either<Failure, UserInfo>> getSavedUserInfo();
}
