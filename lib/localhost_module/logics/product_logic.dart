import 'package:flutter/material.dart';
import 'package:lesson01/localhost_module/models/product_model.dart';
import 'package:lesson01/localhost_module/services/product_service.dart';

class ProductLogic extends ChangeNotifier {
  ProductModel? _productModel;
  ProductModel? get productModel => _productModel;

  String? _error;
  String? get error => _error;

  bool _loading = false;
  bool get loading => _loading;

  void setLoading() {
    _loading = true;
    notifyListeners();
  }

  Future read() async {
    await ProductService.getData(
      onSuccess: (data) => _productModel = data,
      onError: (e) => _error = e,
    );
    _loading = false;
    notifyListeners();
  }
}
