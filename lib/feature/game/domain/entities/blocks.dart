import 'package:mine_clicker/core/constants/app_image_paths.dart';

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
        DiamondBlock()
      ];
}

abstract class Block {
  abstract String blockImage;
  abstract String ingotImage;
}

class CoalOre implements Block {
  @override
  String ingotImage = AppImages.coalIngot;
  @override
  String blockImage = AppImages.coalOre;
}

class CoalOreDeepslate implements Block {
  @override
  String ingotImage = AppImages.coalIngot;
  @override
  String blockImage = AppImages.coalOreDeepslate;
}

class CoalBlock implements Block {
  @override
  String ingotImage = AppImages.coalIngot;
  @override
  String blockImage = AppImages.coalBlock;
}

class CopperOre implements Block {
  @override
  String ingotImage = AppImages.copperIngot;
  @override
  String blockImage = AppImages.copperOre;
}

class CopperOreDeepslate implements Block {
  @override
  String ingotImage = AppImages.copperIngot;
  @override
  String blockImage = AppImages.coalOreDeepslate;
}

class RawCopperBlock implements Block {
  @override
  String ingotImage = AppImages.copperIngot;
  @override
  String blockImage = AppImages.rawCopperBlock;
}

class CopperBlock implements Block {
  @override
  String ingotImage = AppImages.copperIngot;
  @override
  String blockImage = AppImages.copperBlock;
}

class IronOre implements Block {
  @override
  String ingotImage = AppImages.ironIngot;
  @override
  String blockImage = AppImages.ironBlock;
}

class IronOreDeepslate implements Block {
  @override
  String ingotImage = AppImages.ironIngot;
  @override
  String blockImage = AppImages.ironOreDeepslate;
}

class RawIronBlock implements Block {
  @override
  String ingotImage = AppImages.ironIngot;
  @override
  String blockImage = AppImages.rawIronBlock;
}

class IronBlock implements Block {
  @override
  String ingotImage = AppImages.ironIngot;
  @override
  String blockImage = AppImages.ironBlock;
}

class EmeraldOre implements Block {
  @override
  String ingotImage = AppImages.emeraldIngot;
  @override
  String blockImage = AppImages.emeraldOre;
}

class EmeraldOreDeepslate implements Block {
  @override
  String ingotImage = AppImages.emeraldIngot;
  @override
  String blockImage = AppImages.emeraldOreDeepslate;
}

class EmeraldBlock implements Block {
  @override
  String ingotImage = AppImages.emeraldIngot;
  @override
  String blockImage = AppImages.emeraldBlock;
}

class DiamondOre implements Block {
  @override
  String ingotImage = AppImages.diamondIngot;
  @override
  String blockImage = AppImages.diamondOre;
}

class DiamondOreDeepslate implements Block {
  @override
  String ingotImage = AppImages.diamondIngot;
  @override
  String blockImage = AppImages.diamondOreDeepslate;
}

class DiamondBlock implements Block {
  @override
  String ingotImage = AppImages.diamondIngot;
  @override
  String blockImage = AppImages.diamondBlock;
}
