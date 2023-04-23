import 'package:flutter/material.dart';

class ThemeLogic extends ChangeNotifier{
  ThemeMode _mode = ThemeMode.light;
  ThemeMode get mode => _mode;

  void changeToDark(){
    _mode = ThemeMode.dark;
    notifyListeners();
  }

  void changeToLight(){
    _mode = ThemeMode.light;
    notifyListeners();
  }

  void changeToSystem(){
    _mode = ThemeMode.system;
    notifyListeners();
  }
}