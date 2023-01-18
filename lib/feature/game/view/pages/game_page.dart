import 'package:flutter/material.dart';
import 'package:mine_clicker/feature/game/view/widgets/block_widget.dart';
import 'package:mine_clicker/feature/game/view/widgets/upgrade_button.dart';
import 'package:mine_clicker/feature/game/view_model/game_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/money_indicator.dart';

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
                      text: value.ingotCount.toString(),
                    );
                  },
                ),
              ),
              const BlockWidget(),
              const UpgradeButton(),
            ],
          ),
        ),
      ),
    );
  }
}
