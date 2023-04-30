import 'package:flutter/material.dart';
import 'package:lesson01/cache_module/helpers/cache_helper.dart';

class CounterLogic extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  final _cacheHelper = CacheHelper("CounterLogic");

  Future<void> readCache() async {
    String value = await _cacheHelper.read() ?? "0";
    _counter = int.parse(value);
    notifyListeners();
  }

  void decrease() {
    _counter--;
    notifyListeners();

    _cacheHelper.write(_counter.toString());
  }

  void increase() {
    _counter++;
    notifyListeners();

    _cacheHelper.write(_counter.toString());
  }
}
