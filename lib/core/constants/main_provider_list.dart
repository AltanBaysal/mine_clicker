import 'package:mine_clicker/core/init/injection_container.dart' as dp;
import 'package:mine_clicker/feature/game/view_model/game_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class MainProviderList {
  static final List<SingleChildWidget> mainProviderList = [
    ChangeNotifierProvider<GameProvider>(
      create: (final _) => dp.sl(),
    ),
  ];
}
