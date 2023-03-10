import 'package:mine_clicker/core/_core_exports.dart';

class Blocks {
  static List<Block> get inLevelOrder => [
        CoalOre(),
        CoalOreDeepslate(),
        CoalBlock(),
        CopperOre(),
        CopperOreDeepslate(),
        RawCopperBlock(),
        CopperBlock(),
        IronOre(),
        IronOreDeepslate(),
        RawIronBlock(),
        IronBlock(),
        EmeraldOre(),
        EmeraldOreDeepslate(),
        EmeraldBlock(),
        DiamondOre(),
        DiamondOreDeepslate(),
        DiamondBlock(),
      ];
}

abstract class Block {
  abstract String blockImage;
  abstract String ingotImage;
  abstract String blockBreakingSound;
  abstract String blockBreakSound;
  abstract IngotTypes ingotType;
  int get ingotDropRate;
  abstract int upgradeCost;
}

class CoalOre implements Block {
  @override
  String ingotImage = AppImages.coalIngot;
  @override
  String blockImage = AppImages.coalOre;
  @override
  String blockBreakSound = AppSound.stoneBreake;
  @override
  String blockBreakingSound = AppSound.stoneBreaking;

  @override
  IngotTypes ingotType = IngotTypes.coal;
  @override
  int upgradeCost = 10;
  @override
  int get ingotDropRate => 1;
}

class CoalOreDeepslate implements Block {
  @override
  String ingotImage = AppImages.coalIngot;
  @override
  String blockImage = AppImages.coalOreDeepslate;
  @override
  String blockBreakSound = AppSound.deepslateBreake;
  @override
  String blockBreakingSound = AppSound.deepslateBreaking;

  @override
  IngotTypes ingotType = IngotTypes.coal;
  @override
  int upgradeCost = 40;
  @override
  int get ingotDropRate => Random().nextInt(2) + 2; // 1,3
}

class CoalBlock implements Block {
  @override
  String ingotImage = AppImages.coalIngot;
  @override
  String blockImage = AppImages.coalBlock;
  @override
  String blockBreakSound = AppSound.stoneBreake;
  @override
  String blockBreakingSound = AppSound.stoneBreaking;

  @override
  IngotTypes ingotType = IngotTypes.coal;
  @override
  int upgradeCost = 100;
  @override
  int get ingotDropRate => Random().nextInt(2) + 4; //4,6
}

class CopperOre implements Block {
  @override
  String ingotImage = AppImages.copperIngot;
  @override
  String blockImage = AppImages.copperOre;
  @override
  String blockBreakSound = AppSound.copperBlockBreake;
  @override
  String blockBreakingSound = AppSound.copperBlockBreaking;

  @override
  IngotTypes ingotType = IngotTypes.copper;
  @override
  int upgradeCost = 10;
  @override
  int get ingotDropRate => 1;
}

class CopperOreDeepslate implements Block {
  @override
  String ingotImage = AppImages.copperIngot;
  @override
  String blockImage = AppImages.copperOreDeepslate;
  @override
  String blockBreakSound = AppSound.copperBlockBreake;
  @override
  String blockBreakingSound = AppSound.copperBlockBreaking;

  @override
  IngotTypes ingotType = IngotTypes.copper;
  @override
  int upgradeCost = 40;
  @override
  int get ingotDropRate => Random().nextInt(2) + 2;
}

class RawCopperBlock implements Block {
  @override
  String ingotImage = AppImages.copperIngot;
  @override
  String blockImage = AppImages.rawCopperBlock;
  @override
  String blockBreakSound = AppSound.copperBlockBreake;
  @override
  String blockBreakingSound = AppSound.copperBlockBreaking;

  @override
  IngotTypes ingotType = IngotTypes.copper;
  @override
  int upgradeCost = 80;
  @override
  int get ingotDropRate => Random().nextInt(2) + 3;
}

class CopperBlock implements Block {
  @override
  String ingotImage = AppImages.copperIngot;
  @override
  String blockImage = AppImages.copperBlock;
  @override
  String blockBreakSound = AppSound.copperBlockBreake;
  @override
  String blockBreakingSound = AppSound.copperBlockBreaking;

  @override
  IngotTypes ingotType = IngotTypes.copper;
  @override
  int upgradeCost = 160;
  @override
  int get ingotDropRate => Random().nextInt(2) + 4;
}

class IronOre implements Block {
  @override
  String ingotImage = AppImages.ironIngot;
  @override
  String blockImage = AppImages.ironBlock;
  @override
  String blockBreakSound = AppSound.stoneBreake;
  @override
  String blockBreakingSound = AppSound.stoneBreaking;

  @override
  IngotTypes ingotType = IngotTypes.iron;
  @override
  int upgradeCost = 10;
  @override
  int get ingotDropRate => 1;
}

class IronOreDeepslate implements Block {
  @override
  String ingotImage = AppImages.ironIngot;
  @override
  String blockImage = AppImages.ironOreDeepslate;
  @override
  String blockBreakSound = AppSound.deepslateBreake;
  @override
  String blockBreakingSound = AppSound.deepslateBreaking;

  @override
  IngotTypes ingotType = IngotTypes.iron;
  @override
  int upgradeCost = 40;
  @override
  int get ingotDropRate => Random().nextInt(2) + 2;
}

class RawIronBlock implements Block {
  @override
  String ingotImage = AppImages.ironIngot;
  @override
  String blockImage = AppImages.rawIronBlock;
  @override
  String blockBreakSound = AppSound.stoneBreake;
  @override
  String blockBreakingSound = AppSound.stoneBreaking;

  @override
  IngotTypes ingotType = IngotTypes.iron;
  @override
  int upgradeCost = 80;
  @override
  int get ingotDropRate => Random().nextInt(2) + 3;
}

class IronBlock implements Block {
  @override
  String ingotImage = AppImages.ironIngot;
  @override
  String blockImage = AppImages.ironBlock;
  @override
  String blockBreakSound = AppSound.stoneBreake;
  @override
  String blockBreakingSound = AppSound.stoneBreaking;

  @override
  IngotTypes ingotType = IngotTypes.iron;
  @override
  int upgradeCost = 160;
  @override
  int get ingotDropRate => Random().nextInt(2) + 4;
}

class EmeraldOre implements Block {
  @override
  String ingotImage = AppImages.emeraldIngot;
  @override
  String blockImage = AppImages.emeraldOre;
  @override
  String blockBreakSound = AppSound.stoneBreake;
  @override
  String blockBreakingSound = AppSound.stoneBreaking;

  @override
  IngotTypes ingotType = IngotTypes.emerald;
  @override
  int upgradeCost = 10;
  @override
  int get ingotDropRate => 1;
}

class EmeraldOreDeepslate implements Block {
  @override
  String ingotImage = AppImages.emeraldIngot;
  @override
  String blockImage = AppImages.emeraldOreDeepslate;
  @override
  String blockBreakSound = AppSound.deepslateBreake;
  @override
  String blockBreakingSound = AppSound.deepslateBreaking;

  @override
  IngotTypes ingotType = IngotTypes.emerald;
  @override
  int upgradeCost = 40;
  @override
  int get ingotDropRate => Random().nextInt(2) + 2;
}

class EmeraldBlock implements Block {
  @override
  String ingotImage = AppImages.emeraldIngot;
  @override
  String blockImage = AppImages.emeraldBlock;
  @override
  String blockBreakSound = AppSound.stoneBreake;
  @override
  String blockBreakingSound = AppSound.stoneBreaking;

  @override
  IngotTypes ingotType = IngotTypes.emerald;
  @override
  int upgradeCost = 80;
  @override
  int get ingotDropRate => Random().nextInt(2) + 4;
}

class DiamondOre implements Block {
  @override
  String ingotImage = AppImages.diamondIngot;
  @override
  String blockImage = AppImages.diamondOre;
  @override
  String blockBreakSound = AppSound.stoneBreake;
  @override
  String blockBreakingSound = AppSound.stoneBreaking;

  @override
  IngotTypes ingotType = IngotTypes.diamond;
  @override
  int upgradeCost = 10;
  @override
  int get ingotDropRate => 1;
}

class DiamondOreDeepslate implements Block {
  @override
  String ingotImage = AppImages.diamondIngot;
  @override
  String blockImage = AppImages.diamondOreDeepslate;
  @override
  String blockBreakSound = AppSound.deepslateBreake;
  @override
  String blockBreakingSound = AppSound.deepslateBreaking;

  @override
  IngotTypes ingotType = IngotTypes.diamond;
  @override
  int upgradeCost = 40;
  @override
  int get ingotDropRate => Random().nextInt(2) + 2;
}

class DiamondBlock implements Block {
  @override
  String ingotImage = AppImages.diamondIngot;
  @override
  String blockImage = AppImages.diamondBlock;
  @override
  String blockBreakSound = AppSound.stoneBreake;
  @override
  String blockBreakingSound = AppSound.stoneBreaking;

  @override
  IngotTypes ingotType = IngotTypes.diamond;
  @override
  int upgradeCost = -1;
  @override
  int get ingotDropRate => Random().nextInt(2) + 4;
}
