import 'package:dartz/dartz.dart';
import 'package:mine_clicker/core/_core_exports.dart';

class SaveUserInfo implements UseCase<void, UserInfoParams> {
  final UserInfoRepository repository;
  SaveUserInfo(this.repository);

  @override
  Future<Either<Failure, void>> call(UserInfoParams params) {
    return repository.saveUserInfo(UserInfoModel.fromEntity(params.userInfo));
  }
}

class UserInfoParams {
  UserInfo userInfo;
  UserInfoParams(this.userInfo);
}
