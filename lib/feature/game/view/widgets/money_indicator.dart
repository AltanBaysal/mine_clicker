import 'package:mine_clicker/core/_core_exports.dart';

class MoneyIndicator extends StatelessWidget {
  const MoneyIndicator({
    super.key,
    required this.ingotImage,
    required this.text,
    this.style,
    this.size,
  });

  final Size? size;
  final String ingotImage;
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: size?.height ?? sl<ScreenSize>().getWidthPercent(.1),
          width: size?.width ?? sl<ScreenSize>().getWidthPercent(.1),
          child: SvgPicture.asset(
            ingotImage,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: style ?? AppTextStyles.body16SemiBold,
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
