import 'dart:convert';

import 'package:ecommerce_app/constant/api_config.dart';
import 'package:ecommerce_app/model/profile_model/profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<ProfileModel> getProfile() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var _finalStatus = preferences.getInt('logged');
  final response = await http.get(
    Uri.parse(Config.profileUrl + _finalStatus.toString()),
  );
  var jsonResponse = json.decode(response.body);
  if (jsonResponse["success"] == true) {
    final userData = profileModelFromJson(response.body);

    return userData;
  } else {
    return throw Exception('Failed to load APi');
  }
}
