import 'package:get_it/get_it.dart';
import 'package:mine_clicker/core/utils/screen_size.dart';
import 'package:mine_clicker/feature/game/data/datasources/user_info_local_data_source.dart';
import 'package:mine_clicker/feature/game/data/repositories/user_info_repository_impl.dart';
import 'package:mine_clicker/feature/game/domain/repo/user_info_repository.dart';
import 'package:mine_clicker/feature/game/domain/usecases/get_saved_user_info.dart';
import 'package:mine_clicker/feature/game/domain/usecases/save_user_info.dart';
import 'package:mine_clicker/feature/game/view_model/game_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  initFeatures();
  initCore();
  await initExternal();
  await sl<GameProvider>().getUserInfo();
}

void initFeatures() async {
  //providers
  sl.registerLazySingleton<GameProvider>(
    () => GameProvider(
      getSavedUserInfo: sl(),
      saveUserInfo: sl(),
    ),
  );

  //Usecases
  sl.registerLazySingleton<GetSavedUserInfo>(() => GetSavedUserInfo(sl()));
  sl.registerLazySingleton<SaveUserInfo>(() => SaveUserInfo(sl()));

  //Repositorys
  sl.registerLazySingleton<UserInfoRepository>(
    () => UserInfoRepositoryImpl(localDataSource: sl()),
  );

  //DataSources
  sl.registerLazySingleton<UserInfoLocalDataSource>(
    () => UserInfoLocalDataSourceImpl(sharedPreferences: sl()),
  );
}

void initCore() {
  sl.registerLazySingleton<ScreenSize>(() => ScreenSize());
}

Future<void> initExternal() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}
