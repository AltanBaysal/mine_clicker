import 'package:flutter/cupertino.dart';
import '../domain/entities/blocks.dart';

class GameProvider with ChangeNotifier {
  int ingotCount = 0;
  int _currentLevel = 0;

  Block get currentBlock => Blocks.inLevelOrder[_currentLevel];
  Block get nextBlock => Blocks.inLevelOrder[_currentLevel + 1];

  void clickBlock() {
    ingotCount += currentBlock.ingotDropRate;
    notifyListeners();
  }

  void upgradeBlock() {
    if (_currentLevel >= Blocks.inLevelOrder.length--) return;
    if (ingotCount < currentBlock.upgradeCost) return;

    if (currentBlock.ingotType != nextBlock.ingotType) {
      ingotCount = 0;
    } else {
      ingotCount -= currentBlock.upgradeCost;
    }
    _currentLevel++;
    notifyListeners();
  }
}
