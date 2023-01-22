import 'package:flutter/material.dart';
import 'package:mine_clicker/core/constants/main_provider_list.dart';
import 'package:provider/provider.dart';
import 'core/init/injection_container.dart';
import 'core/utils/screen_size.dart';
import "core/init/injection_container.dart" as dp;
import 'feature/game/view/pages/game_page.dart';

void main() async {
  await dp.init();
  runApp(
    MultiProvider(
      providers: MainProviderList.mainProviderList,
      child: const MineClicker(),
    ),
  );
}

class MineClicker extends StatelessWidget {
  const MineClicker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        sl<ScreenSize>().screenSize = MediaQuery.of(context);
        return const GamePage();
      },
      title: 'MineClicker',
      debugShowCheckedModeBanner: false,
    );
  }
}

//ses
//basılı tutunca kırılma
//kazma
//kendi kendine ilerleme
//local save

//audio
//clean architecture
//provider
//responsive design
//shared preferences
//dependency injection