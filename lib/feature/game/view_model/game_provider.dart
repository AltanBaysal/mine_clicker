import 'package:flutter/cupertino.dart';
import '../domain/entities/blocks.dart';

class GameProvider with ChangeNotifier {
  int ingotCount = 5;
  int currentLevel = 5;

  Block get currentBlock => Blocks.inLevelOrder[currentLevel];

  void clickBlock() {
    ingotCount = ingotCount + 1;
    print(ingotCount);
    notifyListeners();
  }

  void upgradeBlock() {
    currentLevel += 1;
    print(currentLevel);
    notifyListeners();
  }
}
