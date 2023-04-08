import 'package:flutter/material.dart';
import 'package:lesson01/multitask_modules/services/post_service.dart';
import '../models/post_model.dart';

class PostLogic extends ChangeNotifier {
  List<PostModel>? _postList;
  List<PostModel>? get postList => _postList;

  String? _error;
  String? get error => _error;

  bool _loading = false;
  bool get loading => _loading;

  void setLoading() {
    _loading = true;
    notifyListeners();
  }

  Future read() async {
    await PostService.getData(
      onSuccess: (data) => _postList = data,
      onError: (e) => _error = e,
    );
    _loading = false;
    notifyListeners();
  }
}
