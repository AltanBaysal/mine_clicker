import 'package:flutter/cupertino.dart';
import 'package:mine_clicker/feature/game/domain/enums/block_types.dart';

class GameProvider extends ChangeNotifier {
  late final BlockTypes currentBlockType;
  late int ingotCount;

  void clickBlock() {
    notifyListeners();
  }

  void upgradeBlock() {
    notifyListeners();
  }
}
