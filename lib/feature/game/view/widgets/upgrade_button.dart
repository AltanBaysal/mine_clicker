import 'package:flutter/material.dart';
import 'package:mine_clicker/core/constants/app_texts.dart';
import 'package:mine_clicker/core/constants/theme/app_text_styles.dart';
import 'package:mine_clicker/core/utils/screen_size.dart';
import 'package:mine_clicker/feature/game/view/widgets/money_indicator.dart';
import 'package:provider/provider.dart';
import '../../../../core/init/injection_container.dart';
import '../../view_model/game_provider.dart';

class UpgradeButton extends StatelessWidget {
  const UpgradeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: sl<GameProvider>().upgradeBlock,
      child: Card(
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          height: sl<ScreenSize>().getHeightPercent(0.07),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                AppTexts.upgrade,
                style: AppTextStyles.titleMain20Semibold,
              ),
              Consumer<GameProvider>(
                builder: (
                  BuildContext context,
                  GameProvider value,
                  Widget? child,
                ) {
                  return MoneyIndicator(
                    size: Size.square(sl<ScreenSize>().getWidthPercent(.07)),
                    ingotImage: value.currentBlock.ingotImage,
                    text: value.currentBlock.upgradeCost.toString(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
