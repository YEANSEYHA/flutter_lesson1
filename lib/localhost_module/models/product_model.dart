// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  List<Result> results;

  ProductModel({
    required this.results,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  String pid;
  String title;
  String price;
  String qty;
  String image;

  Result({
    required this.pid,
    required this.title,
    required this.price,
    required this.qty,
    required this.image,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        pid: json["pid"],
        title: json["title"],
        price: json["price"],
        qty: json["qty"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "pid": pid,
        "title": title,
        "price": price,
        "qty": qty,
        "image": image,
      };
}
