import 'package:mine_clicker/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:mine_clicker/core/usecases/usecase.dart';
import 'package:mine_clicker/feature/game/data/models/user_info_model.dart';
import '../entities/user_info.dart';
import '../repo/user_info_repository.dart';

class SaveUserInfo implements UseCase<void, UserInfoParams> {
  final UserInfoRepository repository;
  SaveUserInfo(this.repository);

  @override
  Future<Either<Failure, void>> call(UserInfoParams params) {
    throw repository.saveUserInfo(UserInfoModel.fromEntity(params.userInfo));
  }
}

class UserInfoParams {
  UserInfo userInfo;
  UserInfoParams(this.userInfo);
}
