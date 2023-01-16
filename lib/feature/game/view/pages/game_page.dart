import 'package:flutter/material.dart';
import 'package:mine_clicker/feature/game/view/widgets/block_widget.dart';
import 'package:mine_clicker/feature/game/view/widgets/upgrade_button.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              MoneyIndicator(),
              BlockWidget(),
              UpgradeButton(),
            ],
          ),
        ),
      ),
    );
  }
}
