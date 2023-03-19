import 'package:flutter/material.dart';

class FavoritesLogic extends ChangeNotifier {
  String fruit = 'Not yet select fruit';

  void changeFruit(String newFruit) {
    fruit = newFruit;
    notifyListeners();
  }
}
