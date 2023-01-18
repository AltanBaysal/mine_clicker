import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mine_clicker/core/constants/app_image_paths.dart';
import 'package:mine_clicker/core/constants/theme/app_text_styles.dart';
import 'package:mine_clicker/core/utils/screen_size.dart';

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
          child: SvgPicture.asset(
            AppImages.coalIngot,
            fit: BoxFit.contain,
          ),
        ),
        Text(
          "99999",
          style: AppTextStyles.body16SemiBold,
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
