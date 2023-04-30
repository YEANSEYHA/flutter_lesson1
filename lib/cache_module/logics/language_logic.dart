import 'package:flutter/material.dart';

import '../constants/language_constant.dart';
import '../helpers/cache_helper.dart';

class LanguageLogic extends ChangeNotifier {
  Language _lang = languageList[1];
  Language get lang => _lang;

  final _cacheHelper = CacheHelper("LanguageLogic");

  Future<void> readCache() async {
    String value = await _cacheHelper.read() ?? "0";
    int index = int.parse(value);
    _lang = languageList[index];
    notifyListeners();
  }

  void changeToEnglish() {
    _lang = languageList[0];
    notifyListeners();
    _cacheHelper.write("0");
  }

  void changeToKhmer() {
    _lang = languageList[1];
    notifyListeners();
    _cacheHelper.write("1");
  }

  void changeToChinese() {
    _lang = languageList[2];
    notifyListeners();
    _cacheHelper.write("2");
  }
}
