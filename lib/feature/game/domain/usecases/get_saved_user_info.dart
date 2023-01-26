import 'package:dartz/dartz.dart';
import 'package:mine_clicker/core/_core_exports.dart';

class GetSavedUserInfo implements UseCase<UserInfo, NoParams> {
  final UserInfoRepository repository;
  GetSavedUserInfo(this.repository);

  @override
  Future<Either<Failure, UserInfo>> call(
    NoParams params,
  ) async {
    return await repository.getSavedUserInfo();
  }
}
