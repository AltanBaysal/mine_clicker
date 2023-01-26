import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:mine_clicker/core/constants/app_image_paths.dart';
import 'package:mine_clicker/core/constants/app_sound.dart';
import 'package:mine_clicker/core/usecases/usecase.dart';
import 'package:mine_clicker/core/utils/audio_player.dart';
import 'package:mine_clicker/feature/game/domain/entities/pickaxe.dart';
import 'package:mine_clicker/feature/game/domain/entities/user_info.dart';
import 'package:mine_clicker/feature/game/domain/usecases/get_saved_user_info.dart';
import 'package:mine_clicker/feature/game/domain/usecases/save_user_info.dart';
import '../domain/entities/blocks.dart';

class GameProvider with ChangeNotifier {
  //fields
  final GetSavedUserInfo getSavedUserInfo;
  final SaveUserInfo saveUserInfo;
  late UserInfo userInfo;
  GameProvider({required this.getSavedUserInfo, required this.saveUserInfo});

  final _blockBreakingSoundPlayer = SoundPlayer(releaseMode: ReleaseMode.LOOP);
  late Timer _blockBreakingTimer;

  //getters
  Block get currentBlock => Blocks.inLevelOrder[userInfo.currentLevel];
  Block get nextBlock {
    return Blocks.inLevelOrder[min(
      userInfo.currentLevel + 1,
      Blocks.inLevelOrder.length - 1,
    )];
  }

  Pickaxe get currentPickaxe =>
      Pickaxes.inLevelOrder[userInfo.currentPickaxeLevel];
  Pickaxe get nextPickaxe {
    return Pickaxes.inLevelOrder[min(
      userInfo.currentPickaxeLevel + 1,
      Pickaxes.inLevelOrder.length - 1,
    )];
  }

  int _blockBreakLevel = 0;
  String get blockBreakingSvg => AppImages.destroyStages[min(
        _blockBreakLevel,
        AppImages.destroyStages.length - 1,
      )];

  //functions
  Future<void> getUserInfo() async {
    final data = await getSavedUserInfo(NoParams());
    data.fold(
      (l) {
        userInfo = UserInfo(
          ingotCount: 0,
          currentLevel: 0,
          currentPickaxeLevel: 0,
        );
      },
      (r) {
        userInfo = r;
      },
    );
  }

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
    userInfo.ingotCount += currentBlock.ingotDropRate;
    saveUserInfo(UserInfoParams(userInfo));
  }

  void upgradeBlock() {
    if (userInfo.currentLevel >= Blocks.inLevelOrder.length - 1) return;
    if (userInfo.ingotCount < currentBlock.upgradeCost) return;

    if (currentBlock.ingotType != nextBlock.ingotType) {
      userInfo.ingotCount = 0;
    } else {
      userInfo.ingotCount -= currentBlock.upgradeCost;
    }
    final upgradeSoundPlayer = SoundPlayer();
    upgradeSoundPlayer.play(AppSound.upgrade);
    userInfo.currentLevel++;
    notifyListeners();
    saveUserInfo(UserInfoParams(userInfo));
  }

  void upgradePickaxe() {
    if (userInfo.currentPickaxeLevel >= Pickaxes.inLevelOrder.length - 1) {
      return;
    }

    if (userInfo.ingotCount < currentPickaxe.upgradeCost) return;
    userInfo.ingotCount -= currentPickaxe.upgradeCost;
    final upgradeSoundPlayer = SoundPlayer();
    upgradeSoundPlayer.play(AppSound.itemUpgrade);
    userInfo.currentPickaxeLevel++;
    notifyListeners();
    saveUserInfo(UserInfoParams(userInfo));
  }
}
