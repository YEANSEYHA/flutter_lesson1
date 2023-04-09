import 'package:flutter/material.dart';
import 'package:lesson01/multitask_modules/models/randomuser_model.dart';
import 'package:lesson01/multitask_modules/services/randomuser_service.dart';

class RandomUserLogic extends ChangeNotifier {
  RandomUserModel? _userModel;
  RandomUserModel? get userModel => _userModel;

  String? _error;
  String? get error => _error;

  bool _loading = false;
  bool get loading => _loading;

  void setLoading() {
    _loading = true;
    notifyListeners();
  }

  Future read() async {
    await RandomUserService.getData(
      onSuccess: (data) => _userModel = data,
      onError: (e) => _error = e,
    );
    _loading = false;
    notifyListeners();
  }
}
