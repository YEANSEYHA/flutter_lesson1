import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:lesson01/multitask_modules/models/randomuser_model.dart';

class RandomUserService {
  static Future<void> getData({
    required void Function(RandomUserModel?) onSuccess,
    required void Function(String?) onError,
  }) async {
    String url = "https://randomuser.me/api?results=50&page=2";
    try {
      http.Response response = await http.get(Uri.parse(url));
      onSuccess(await compute(randomUserModelFromJson, response.body));
      onError(null);
    } catch (e) {
      onError(e.toString());
    }
  }
}
