import 'dart:convert';

import 'package:ecommerce_app/constant/api_config.dart';
import 'package:ecommerce_app/model/category_model/category_model.dart';
import 'package:http/http.dart' as http;

Future<CategoryModel> getCategory() async {
  try {
    final response = await http.get(
      Uri.parse(Config.categories),
    );
    var jsonResponse = jsonDecode(response.body);

    if (jsonResponse["success"] == true) {
      final categoryList = categoryModelFromJson(response.body);

      // await leadData
      //     .map<LeadListModel>((json) => LeadListModel.fromJson(json))
      //     .toList();
      return categoryList;
    } else {
      return throw Exception('Failed to load APi');
    }
  } catch (e) {
    print("the eror is $e");
  }

  throw Exception('Failed to load image from banner');

  // await leadData
  //     .map<LeadListModel>((json) => LeadListModel.fromJson(json))
  //     .toList();
}
