import 'package:mine_clicker/core/_core_exports.dart';

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
