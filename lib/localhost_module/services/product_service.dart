import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:lesson01/localhost_module/models/product_model.dart';

class ProductService {
  static Future<void> getData({
    required void Function(ProductModel?) onSuccess,
    required void Function(String?) onError,
  }) async {
    String iOSUrl = "http://localhost:8888/flutterproject/read.php";
    String AndroidUrl = "http://10.0.2.2:8888/flutterproject/read.php";
    try {
      http.Response response = await http.get(Uri.parse(iOSUrl));
      onSuccess(await compute(productModelFromJson, response.body));
      onError(null);
    } catch (e) {
      onError(e.toString());
    }
  }
}
