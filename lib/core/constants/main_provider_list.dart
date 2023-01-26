import 'package:mine_clicker/core/_core_exports.dart';

class MainProviderList {
  static final List<SingleChildWidget> mainProviderList = [
    ChangeNotifierProvider<GameProvider>(
      create: (final _) => sl(),
    ),
  ];
}
