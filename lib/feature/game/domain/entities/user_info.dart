import 'package:equatable/equatable.dart';

class UserInfo extends Equatable {
  int ingotCount;
  int currentLevel;
  int currentPickaxeLevel;

  UserInfo({
    required this.ingotCount,
    required this.currentLevel,
    required this.currentPickaxeLevel,
  });

  @override
  List<Object?> get props => [ingotCount, currentLevel, currentPickaxeLevel];
}
