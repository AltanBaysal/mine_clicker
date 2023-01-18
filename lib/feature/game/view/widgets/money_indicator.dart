import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mine_clicker/core/constants/theme/app_text_styles.dart';
import 'package:mine_clicker/core/utils/screen_size.dart';
import 'package:mine_clicker/feature/game/view_model/game_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/init/injection_container.dart';

class MoneyIndicator extends StatelessWidget {
  const MoneyIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: sl<ScreenSize>().getWidthPercent(.1),
          width: sl<ScreenSize>().getWidthPercent(.1),
          child: Consumer<GameProvider>(
            builder: (BuildContext context, GameProvider value, Widget? child) {
              return SvgPicture.asset(
                value.currentBlock.ingotImage,
                fit: BoxFit.contain,
              );
            },
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Consumer<GameProvider>(
          builder: (BuildContext context, GameProvider value, Widget? child) {
            return Text(
              value.ingotCount.toString(),
              style: AppTextStyles.body16SemiBold,
            );
          },
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
