import 'package:mine_clicker/core/_core_exports.dart';

class BlockWidget extends StatelessWidget {
  const BlockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: sl<GameProvider>().blockOnPress,
      onLongPressEnd: sl<GameProvider>().blockOnPressCanceled,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: sl<ScreenSize>().getWidthPercent(.4),
            width: sl<ScreenSize>().getWidthPercent(.4),
            child: Selector<GameProvider, String>(
              selector: (final _, GameProvider value) =>
                  value.currentBlock.blockImage,
              builder: (
                BuildContext context,
                String value,
                Widget? child,
              ) {
                return SvgPicture.asset(
                  value,
                  fit: BoxFit.contain,
                );
              },
            ),
          ),
          SizedBox(
            height: sl<ScreenSize>().getWidthPercent(.4),
            width: sl<ScreenSize>().getWidthPercent(.4),
            child: Selector<GameProvider, String>(
              selector: (final _, GameProvider value) => value.blockBreakingSvg,
              builder: (
                BuildContext context,
                String value,
                Widget? child,
              ) {
                return SvgPicture.asset(
                  value,
                  fit: BoxFit.contain,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
