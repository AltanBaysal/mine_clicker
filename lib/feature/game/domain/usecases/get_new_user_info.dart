import 'package:dartz/dartz.dart';
import 'package:mine_clicker/feature/game/domain/entities/user_info.dart';
import 'package:mine_clicker/feature/game/domain/repo/user_info_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetNewUserInfo implements UseCase<UserInfo, NoParams> {
  final UserInfoRepository repository;
  GetNewUserInfo(this.repository);

  @override
  Future<Either<Failure, UserInfo>> call(
    NoParams params,
  ) async {
    return await repository.getNewUserInfo();
  }
}
