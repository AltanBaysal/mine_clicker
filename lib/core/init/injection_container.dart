import 'package:get_it/get_it.dart';
import 'package:mine_clicker/core/utils/screen_size.dart';
import 'package:mine_clicker/feature/game/view_model/game_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  initFeatures();
  initCore();
  await initExternal();
}

void initFeatures() {
  sl.registerLazySingleton<GameProvider>(() => GameProvider());
}

void initCore() {
  sl.registerLazySingleton<ScreenSize>(() => ScreenSize());
}

Future<void> initExternal() async {}
