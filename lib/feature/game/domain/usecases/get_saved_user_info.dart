import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mine_clicker/feature/game/domain/entities/user_info.dart';
import 'package:mine_clicker/feature/game/domain/repo/user_info_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetSavedUserInfo implements UseCase<UserInfo, NoParams> {
  final UserInfoRepository repository;
  GetSavedUserInfo(this.repository);

  @override
  Future<Either<Failure, UserInfo>> call(
    NoParams params,
  ) async {
    return await repository.getConcreteNumberTrivia();
  }
}

//?
class Params extends Equatable {
  final int number;

  const Params({required this.number});

  @override
  List<Object?> get props => [number];
}
