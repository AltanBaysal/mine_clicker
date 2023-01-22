import 'package:flutter/cupertino.dart';
import 'package:mine_clicker/core/constants/app_sound.dart';
import 'package:mine_clicker/core/utils/audio_player.dart';
import '../domain/entities/blocks.dart';

class GameProvider with ChangeNotifier {
  final soundPlayer = SoundPlayer();
  int ingotCount = 0;
  int _currentLevel = 0;
  final stopwatch = Stopwatch();

  Block get currentBlock => Blocks.inLevelOrder[_currentLevel];
  Block get nextBlock => Blocks.inLevelOrder[_currentLevel + 1];

  double miningSpeed = 1;
  void blockOnPress() {
    breakBlock();
  }

  void blockOnPressCanceled() {}

  void breakBlock() async {
    soundPlayer.play(currentBlock.blockBreakSound);
    await Future.delayed(const Duration(milliseconds: 350));
    soundPlayer.play(AppSound.itemCollecting);
    await Future.delayed(const Duration(milliseconds: 200));
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
    soundPlayer.play(AppSound.upgrade);
    _currentLevel++;
    notifyListeners();
  }
}
