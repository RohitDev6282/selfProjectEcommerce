import 'dart:convert';
import 'package:ecommerce_app/constant/api_config.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_app/model/product_List/product_list.dart';

Future<ProductListModel> getProductlist() async {
  final response = await http.get(
    Uri.parse(Config.productlist),
  );
  try {
    var jsonResponse = jsonDecode(response.body);

    if (jsonResponse["success"] == true) {
      final productList = productListModelFromJson(response.body);

      // await leadData
      //     .map<LeadListModel>((json) => LeadListModel.fromJson(json))
      //     .toList();
      return productList;
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
