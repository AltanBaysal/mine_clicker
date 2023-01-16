import 'package:flutter/cupertino.dart';

class GameProvider extends ChangeNotifier {
  void clickBlock() {
    notifyListeners();
  }

  void upgradeBlock() {
    notifyListeners();
  }
}
