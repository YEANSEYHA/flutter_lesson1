import 'package:flutter/material.dart';
import '../helpers/cache_helper.dart';

class ThemeLogic extends ChangeNotifier {
  ThemeMode _mode = ThemeMode.light;
  ThemeMode get mode => _mode;

  final _cacheHelper = CacheHelper("ThemeLogic");

  Future<void> readCache() async {
    String value = await _cacheHelper.read() ?? "light";
    debugPrint("value = $value");
    if (value == "system") {
      _mode = ThemeMode.system;
    } else if (value == "dark") {
      _mode = ThemeMode.dark;
    } else {
      _mode = ThemeMode.light;
    }

    notifyListeners();
  }

  void changeToDark() {
    _mode = ThemeMode.dark;
    notifyListeners();
    debugPrint("_mode.name = ${_mode.name}");
    _cacheHelper.write(_mode.name.toString());
  }

  void changeToLight() {
    _mode = ThemeMode.light;
    notifyListeners();
    debugPrint("_mode.name = ${_mode.name}");
    _cacheHelper.write(_mode.name.toString());
  }

  void changeToSystem() {
    _mode = ThemeMode.system;
    notifyListeners();
    debugPrint("_mode.name = ${_mode.name}");
    _cacheHelper.write(_mode.name.toString());
  }
}
