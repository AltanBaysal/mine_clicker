import 'package:mine_clicker/core/_core_exports.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Consumer<GameProvider>(
                  builder: (
                    BuildContext context,
                    GameProvider value,
                    Widget? child,
                  ) {
                    return MoneyIndicator(
                      ingotImage: value.currentBlock.ingotImage,
                      text: value.userInfo.ingotCount.toString(),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: sl<ScreenSize>().getWidthPercent(.15),
                ),
                child: const BlockWidget(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Consumer<GameProvider>(
                    builder: (context, value, child) {
                      return UpgradeButton(
                        cost: value.currentBlock.upgradeCost.toString(),
                        icon: value.currentBlock.ingotImage,
                        onTap: value.upgradeBlock,
                        nextItemImage: value.nextBlock.blockImage,
                      );
                    },
                  ),
                  Consumer<GameProvider>(
                    builder: (context, value, child) {
                      return UpgradeButton(
                        cost: value.currentPickaxe.upgradeCost.toString(),
                        icon: value.currentBlock.ingotImage,
                        onTap: value.upgradePickaxe,
                        nextItemImage: value.nextPickaxe.image,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
