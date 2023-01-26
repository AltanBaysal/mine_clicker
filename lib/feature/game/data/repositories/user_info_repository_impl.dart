import 'package:mine_clicker/core/error/exceptions.dart';
import 'package:mine_clicker/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:mine_clicker/feature/game/data/datasources/user_info_local_data_source.dart';
import 'package:mine_clicker/feature/game/data/models/user_info_model.dart';
import 'package:mine_clicker/feature/game/domain/entities/user_info.dart';
import 'package:mine_clicker/feature/game/domain/repo/user_info_repository.dart';

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
