import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:lesson01/multitask_modules/models/post_model.dart';

class PostService {
  static Future<void> getData({
    required void Function(List<PostModel>?) onSuccess,
    required void Function(String?) onError,
  }) async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    try {
      http.Response response = await http.get(Uri.parse(url));
      onSuccess(await compute(_convert, response.body));
      onError(null);
    } catch (e) {
      print("postService2: $url");
      // onSuccess(null); //remove it
      onError(e.toString());
    }
  }

  static List<PostModel> _convert(String body) {
    List list = json.decode(body);
    List<PostModel> posts = list.map((e) => PostModel.fromJson(e)).toList();
    return posts;
  }
}
