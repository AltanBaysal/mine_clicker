import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/app_image_paths.dart';
import '../../../../core/init/injection_container.dart';
import '../../view_model/game_provider.dart';

class BlockWidget extends StatelessWidget {
  const BlockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: sl<GameProvider>().clickBlock,
      child: SizedBox(
        height: 200,
        width: 200,
        child: SvgPicture.asset(
          AppImages.coalBlock,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
