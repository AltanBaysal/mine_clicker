import 'dart:convert';

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
  Future<Either<Failure, UserInfo>> getNewUserInfo() async {
    return Right(UserInfo(
      ingotCount: 0,
      currentLevel: 0,
      currentPickaxeLevel: 0,
    ));
  }

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
  Future<void> saveUserInfo(UserInfoModel userInfoModel) {
    try {
      return localDataSource.saveUserInfo(userInfoModel);
    } on CacheException {
      return throw Exception();
    }
  }
}
