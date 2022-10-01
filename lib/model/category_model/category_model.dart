// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(jsonDecode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    this.success,
    this.message,
    this.path,
    this.data,
  });

  final bool? success;
  final String? message;
  final String? path;
  final List<Datum>? data;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
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
    this.id,
    this.categoryName,
    this.categoryImage,
    this.slug,
    this.subCategoryId,
    this.displayOrder,
    this.status,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
  });

  int? id;
  String? categoryName;
  String? categoryImage;
  String? slug;
  int? subCategoryId;
  int? displayOrder;
  int? status;
  DateTime? createdAt;
  int? createdBy;
  DateTime? updatedAt;
  dynamic updatedBy;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        categoryName:
            json["category_name"] == null ? null : json["category_name"],
        categoryImage:
            json["category_image"] == null ? null : json["category_image"],
        slug: json["slug"] == null ? null : json["slug"],
        subCategoryId:
            json["sub_category_id"] == null ? null : json["sub_category_id"],
        displayOrder:
            json["display_order"] == null ? null : json["display_order"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        createdBy: json["created_by"] == null ? null : json["created_by"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        updatedBy: json["updated_by"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "category_name": categoryName == null ? null : categoryName,
        "category_image": categoryImage == null ? null : categoryImage,
        "slug": slug == null ? null : slug,
        "sub_category_id": subCategoryId == null ? null : subCategoryId,
        "display_order": displayOrder == null ? null : displayOrder,
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "created_by": createdBy == null ? null : createdBy,
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "updated_by": updatedBy,
      };
}
