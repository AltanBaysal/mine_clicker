import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mine_clicker/core/utils/screen_size.dart';
import 'package:mine_clicker/feature/game/view/widgets/money_indicator.dart';
import '../../../../core/init/injection_container.dart';

class UpgradeButton extends StatelessWidget {
  const UpgradeButton({
    super.key,
    this.onTap,
    required this.nextItemImage,
    required this.cost,
    required this.icon,
  });

  final void Function()? onTap;
  final String nextItemImage;
  final String cost;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          width: sl<ScreenSize>().getWidthPercent(0.3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox.square(
                dimension: sl<ScreenSize>().getHeightPercent(0.1),
                child: SvgPicture.asset(
                  nextItemImage,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MoneyIndicator(
                size: Size.square(sl<ScreenSize>().getWidthPercent(.07)),
                ingotImage: icon,
                text: cost,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
