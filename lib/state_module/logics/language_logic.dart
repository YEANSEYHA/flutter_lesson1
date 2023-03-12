import 'package:flutter/material.dart';
import 'package:lesson01/state_module/constants/language_constant.dart';

class LanguageLogic extends ChangeNotifier {
  Language _lang = languageList[0];
  Language get lang => _lang;

  void changeToEnglish() {
    _lang = languageList[0];
    notifyListeners();
  }

  void changeToKhmer() {
    _lang = languageList[1];
    notifyListeners();
  }
}
