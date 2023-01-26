import 'package:dartz/dartz.dart';
import 'package:mine_clicker/core/_core_exports.dart';

class UserInfoRepositoryImpl implements UserInfoRepository {
  final UserInfoLocalDataSource localDataSource;

  UserInfoRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, UserInfo>> getSavedUserInfo() async {
    try {
      final localUserInfo = await localDataSource.getSavedUserInfo();
      return Right(localUserInfo);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> saveUserInfo(
    UserInfoModel userInfoModel,
  ) async {
    try {
      return Right(localDataSource.saveUserInfo(userInfoModel));
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
