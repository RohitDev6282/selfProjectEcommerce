// To parse this JSON data, do
//
//     final productListModel = productListModelFromJson(jsonString);

import 'dart:convert';

ProductListModel productListModelFromJson(String str) =>
    ProductListModel.fromJson(json.decode(str));

String productListModelToJson(ProductListModel data) =>
    json.encode(data.toJson());

class ProductListModel {
  ProductListModel({
    this.success,
    this.message,
    this.path,
    this.data,
  });

  bool? success;
  String? message;
  String? path;
  List<Datum>? data;

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      ProductListModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        path: json["path"] == null ? null : json["path"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "message": message == null ? null : message,
        "path": path == null ? null : path,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.productName,
    this.slug,
    this.description,
    this.specification,
    this.features,
    this.mainImage,
    this.mrp,
    this.sellingPrice,
    this.discount,
    this.categoryName,
  });

  String? productName;
  String? slug;
  String? description;
  String? specification;
  String? features;
  String? mainImage;
  int? mrp;
  int? sellingPrice;
  int? discount;
  String? categoryName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        productName: json["product_name"] == null ? null : json["product_name"],
        slug: json["slug"] == null ? null : json["slug"],
        description: json["description"] == null ? null : json["description"],
        specification:
            json["specification"] == null ? null : json["specification"],
        features: json["features"] == null ? null : json["features"],
        mainImage: json["main_image"] == null ? null : json["main_image"],
        mrp: json["mrp"] == null ? null : json["mrp"],
        sellingPrice:
            json["selling_price"] == null ? null : json["selling_price"],
        discount: json["discount"] == null ? null : json["discount"],
        categoryName:
            json["category_name"] == null ? null : json["category_name"],
      );

  Map<String, dynamic> toJson() => {
        "product_name": productName == null ? null : productName,
        "slug": slug == null ? null : slug,
        "description": description == null ? null : description,
        "specification": specification == null ? null : specification,
        "features": features == null ? null : features,
        "main_image": mainImage == null ? null : mainImage,
        "mrp": mrp == null ? null : mrp,
        "selling_price": sellingPrice == null ? null : sellingPrice,
        "discount": discount == null ? null : discount,
        "category_name": categoryName == null ? null : categoryName,
      };
}
