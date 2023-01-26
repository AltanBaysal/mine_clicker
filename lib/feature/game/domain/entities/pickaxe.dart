import 'package:mine_clicker/core/_core_exports.dart';

class Pickaxes {
  static final List<Pickaxe> inLevelOrder = [
    WoodenPickaxe(),
    StonePickaxe(),
    IronPickaxe(),
    GoldenPickaxe(),
    DiamondPickaxe(),
    NetheritePickaxe(),
  ];
}

abstract class Pickaxe {
  abstract int speed;
  abstract String image;
  abstract int upgradeCost;
}

class NetheritePickaxe implements Pickaxe {
  @override
  int speed = 100;

  @override
  String image = AppImages.netheritePickaxe;

  @override
  int upgradeCost = 640;
}

class DiamondPickaxe implements Pickaxe {
  @override
  int speed = 80;

  @override
  String image = AppImages.diamondPickaxe;

  @override
  int upgradeCost = 320;
}

class GoldenPickaxe implements Pickaxe {
  @override
  int speed = 50;

  @override
  String image = AppImages.goldenPickaxe;

  @override
  int upgradeCost = 160;
}

class IronPickaxe implements Pickaxe {
  @override
  int speed = 30;

  @override
  String image = AppImages.ironPickaxe;

  @override
  int upgradeCost = 80;
}

class StonePickaxe implements Pickaxe {
  @override
  int speed = 20;

  @override
  String image = AppImages.stonePickaxe;

  @override
  int upgradeCost = 40;
}

class WoodenPickaxe implements Pickaxe {
  @override
  int speed = 10;

  @override
  String image = AppImages.woodenPickaxe;

  @override
  int upgradeCost = 20;
}
