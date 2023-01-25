import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:mine_clicker/core/constants/app_image_paths.dart';
import 'package:mine_clicker/core/constants/app_sound.dart';
import 'package:mine_clicker/core/utils/audio_player.dart';
import 'package:mine_clicker/feature/game/domain/entities/pickaxe.dart';
import '../domain/entities/blocks.dart';

class GameProvider with ChangeNotifier {
  final _blockBreakingSoundPlayer = SoundPlayer(releaseMode: ReleaseMode.LOOP);
  late Timer _blockBreakingTimer;

  int ingotCount = 999;
  int _currentLevel = 0;
  int _currentPickaxeLevel = 0;

  Block get currentBlock => Blocks.inLevelOrder[_currentLevel];
  Block get nextBlock {
    return Blocks.inLevelOrder[min(
      _currentLevel + 1,
      Blocks.inLevelOrder.length - 1,
    )];
  }

  Pickaxe get currentPickaxe => Pickaxes.inLevelOrder[_currentPickaxeLevel];
  Pickaxe get nextPickaxe {
    return Pickaxes.inLevelOrder[min(
      _currentPickaxeLevel + 1,
      Pickaxes.inLevelOrder.length - 1,
    )];
  }

  int _blockBreakLevel = 0;
  String get blockBreakingSvg => AppImages.destroyStages[min(
        _blockBreakLevel,
        AppImages.destroyStages.length - 1,
      )];

  void blockOnPress(LongPressStartDetails longPressStartDetails) {
    _blockBreakingSoundPlayer.play(currentBlock.blockBreakingSound);
    _blockBreakingTimer = Timer.periodic(
      Duration(milliseconds: 1000 ~/ currentPickaxe.speed),
      (timer) async {
        if (_blockBreakLevel + 2 >= AppImages.destroyStages.length) {
          breakBlock();
          collectItem();
          notifyListeners();
        } else {
          _blockBreakLevel++;
          notifyListeners();
        }
      },
    );
  }

  void blockOnPressCanceled(LongPressEndDetails longPressStartDetails) {
    _blockBreakingSoundPlayer.pause();
    _blockBreakingTimer.cancel();
    _blockBreakLevel = 0;
    notifyListeners();
  }

  Future<void> breakBlock() async {
    final SoundPlayer soundPlayer = SoundPlayer();
    await soundPlayer.playAndWait(
      currentBlock.blockBreakSound,
      const Duration(milliseconds: 0),
    );
    _blockBreakLevel++;
    notifyListeners();
    _blockBreakLevel = 0;
    notifyListeners();
  }

  Future<void> collectItem() async {
    final itemCollectSoundPlayer = SoundPlayer();
    await Future.delayed(const Duration(milliseconds: 350));
    itemCollectSoundPlayer.play(AppSound.itemCollecting);
    await Future.delayed(const Duration(milliseconds: 100));
    ingotCount += currentBlock.ingotDropRate;
  }

  void upgradeBlock() {
    if (_currentLevel >= Blocks.inLevelOrder.length - 1) return;
    if (ingotCount < currentBlock.upgradeCost) return;

    if (currentBlock.ingotType != nextBlock.ingotType) {
      ingotCount = 0;
    } else {
      ingotCount -= currentBlock.upgradeCost;
    }
    final upgradeSoundPlayer = SoundPlayer();
    upgradeSoundPlayer.play(AppSound.upgrade);
    _currentLevel++;
    notifyListeners();
  }

  void upgradePickaxe() {
    if (_currentPickaxeLevel >= Pickaxes.inLevelOrder.length - 1) return;
    if (ingotCount < currentPickaxe.upgradeCost) return;
    ingotCount -= currentPickaxe.upgradeCost;
    final upgradeSoundPlayer = SoundPlayer();
    upgradeSoundPlayer.play(AppSound.itemUpgrade);
    _currentPickaxeLevel++;
    notifyListeners();
  }
}
