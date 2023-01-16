import 'package:flutter/material.dart';
import 'package:mine_clicker/core/constants/app_texts.dart';
import 'package:mine_clicker/core/constants/theme/app_text_styles.dart';
import 'package:mine_clicker/core/utils/screen_size.dart';
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
        child: SizedBox(
          height: sl<ScreenSize>().getHeightPercent(0.06),
          child: Center(
            child: Text(
              AppTexts.upgrade,
              style: AppTextStyles.body16Regular,
            ),
          ),
        ),
      ),
    );
  }
}
