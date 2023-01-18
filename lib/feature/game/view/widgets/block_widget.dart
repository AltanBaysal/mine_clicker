import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../core/init/injection_container.dart';
import '../../../../core/utils/screen_size.dart';
import '../../view_model/game_provider.dart';

class BlockWidget extends StatelessWidget {
  const BlockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: sl<GameProvider>().clickBlock,
      child: SizedBox(
        height: sl<ScreenSize>().getWidthPercent(.4),
        width: sl<ScreenSize>().getWidthPercent(.4),
        child: Consumer<GameProvider>(
          builder: (BuildContext context, GameProvider value, Widget? child) {
            return SvgPicture.asset(
              value.currentBlock.blockImage,
              fit: BoxFit.contain,
            );
          },
        ),
      ),
    );
  }
}
